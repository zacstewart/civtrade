class Shop < ActiveRecord::Base

  CURRENCIES = %w( g i b c w v d r n l ).freeze
  WORLDS = %w( overworld nether end ).freeze

  validates :item_name, :world, :location_x, :location_y, :location_z, presence: true
  validates :sell_amount, :sell_price, :sell_currency, presence: true, unless: :buying?
  validates :buy_amount, :buy_price, :buy_currency, presence: true, unless: :selling?
  validates :buy_currency, :sell_currency, inclusion: {in: CURRENCIES}, allow_blank: true
  validates :world, inclusion: {in: WORLDS}

  belongs_to :item
  has_many :reports

  scope :best, order('reports_count ASC')

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
end
