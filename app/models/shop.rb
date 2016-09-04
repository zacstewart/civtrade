class Shop < ActiveRecord::Base
  CIVCRAFT_SERVER_PATTERN = /mc\.civcraft\.vg:25565|untamedears.com:25565/
  LOCALHOST = /(127.0.0.1|localhost):25565/

  include PgSearch

  attr_accessor :server

  validates :output_item_name, :output_amount, :input_item_name, :input_amount,
    :world, :location_x, :location_y, :location_z, presence: true
  validates :world, inclusion: {in: WORLDS}
  validate :server_is_test_or_civcraft

  belongs_to :output_item, class_name: 'Item'
  belongs_to :input_item, class_name: 'Item'
  has_many :reports

  after_save { IndexedShop.index_shop self }

  scope :best, order('reports_count ASC')

  pg_search_scope :search, against: [:input_item_name, :output_item_name, :city, :seller_username]

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

  private

  def server_is_test_or_civcraft
    unless server.blank? || server =~ CIVCRAFT_SERVER_PATTERN || server =~ LOCALHOST
      errors.add(:server, "You can only list Civcraft shops")
    end
  end
end
