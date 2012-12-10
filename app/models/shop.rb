class Shop < ActiveRecord::Base
  validates :item, :location_x, :location_y, :location_z, presence: true
  validates :sell_amount, :sell_price, :sell_currency, presence: true, unless: :buying?
  validates :buy_amount, :buy_price, :buy_currency, presence: true, unless: :selling?

  def buying?
    buy_amount.present? && buy_price.present? && buy_currency.present?
  end

  def selling?
    sell_amount.present? && sell_price.present? && sell_currency.present?
  end
end
