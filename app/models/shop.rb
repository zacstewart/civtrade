class Shop < ActiveRecord::Base
  CIVCRAFT_SERVER_PATTERN = /mc\.civcraft\.co|149\.56\.23\.82/
  LOCALHOST = /(127.0.0.1|localhost)/

  include PgSearch

  attr_accessor :server_address

  validates :output_item_name, :output_amount, :input_item_name, :input_amount,
    :world_uuid, :location_x, :location_y, :location_z, :which,
    :exchanges_available, presence: true
  validates :world_uuid, inclusion: {in: World.ids}
  validate :server_is_test_or_civcraft

  belongs_to :output_item, class_name: 'Item'
  belongs_to :input_item, class_name: 'Item'
  has_many :reports

  after_save do
    IndexedShop.index_shop self
  end

  scope :best, order('reports_count ASC')

  pg_search_scope :search, against: [:input_item_name, :output_item_name, :city, :seller_username]

  def self.safely_create(params)
    location_params = params.slice(
      :world, :location_x, :location_y, :location_z, :which)
    where(location_params).first_or_initialize.tap do |shop|
      transaction do
        shop.update_attributes!(params)
        shop.reports.destroy_all
      end
    end
  end

  def output_item_name=(name)
    super
    items = Item.named(name)
    self.output_item = items.first if items.any?
  end

  def input_item_name=(name)
    super
    items = Item.named(name)
    self.input_item = items.first if items.any?
  end

  def world
    World.find(world_uuid)
  end

  private

  def server_is_test_or_civcraft
    return if server_address.blank?

    unless server_address =~ Regexp.union(CIVCRAFT_SERVER_PATTERN, LOCALHOST)
      errors.add(:server_address, "You can only list Civcraft shops")
    end
  end
end
