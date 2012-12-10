class ShopDecorator < Draper::Base
  decorates :shop

  def buy_for
    if shop.buy_amount.present?
      "#{shop.buy_amount} for #{buy_price_with_currency}"
    end
  end

  def sell_for
    if shop.sell_amount.present?
      "#{shop.sell_amount} for #{sell_price_with_currency}"
    end
  end

  def buy_price_with_currency
    shop.buy_price.to_s + shop.buy_currency
  end

  def sell_price_with_currency
    shop.sell_price.to_s + shop.sell_currency
  end

  def location
    "#{shop.location_x}, #{shop.location_y}, #{shop.location_z}"
  end
end
