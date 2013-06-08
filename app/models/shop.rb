class Shop < ActiveRecord::Base
  CIVCRAFT_SERVER_PATTERN = /mc\.civcraft\.vg:25565|untamedears.com:25565/
  CIVCRAFT_SERVER_PATTERN = /(127.0.0.1|localhost):25565/

  include PgSearch

  attr_accessor :server

  validates :item_name, :world, :location_x, :location_y, :location_z, presence: true
  validates :sell_amount, :sell_price, :sell_currency, presence: true, unless: :buying?
  validates :buy_amount, :buy_price, :buy_currency, presence: true, unless: :selling?
  validates :buy_currency, :sell_currency, inclusion: {in: CURRENCIES}, allow_blank: true
  validates :world, inclusion: {in: WORLDS}
  validate :server_is_test_or_civcraft

  belongs_to :item
  has_many :reports

  after_save { IndexedShop.index_shop self }

  scope :best, order('reports_count ASC')

  pg_search_scope :search, against: [:item_name, :city, :seller_username]

  def item_name=(name)
    super
    items = Item.named(name)
    self.item = items.first if items.any?
  end

  def buying?
    buy_amount.present? && buy_price.present? && buy_currency.present?
  end

  def selling?
    sell_amount.present? && sell_price.present? && sell_currency.present?
  end

  private
  def server_is_test_or_civcraft
    unless server.blank?  || server =~ CIVCRAFT_SERVER_PATTERN || server =~ LOCALHOST
      errors.add(:server, "You can only list Civcraft shops")
    end
  end
end
