class ShopDecorator < Draper::Base
  decorates :shop

  def item_name
    if shop.item.present?
      h.link_to(shop.item.name, shop.item)
    else
      shop.item_name
    end
  end

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
    shop.buy_price.to_s + shop.buy_currency if shop.buy_price && shop.buy_currency
  end

  def sell_price_with_currency
    shop.sell_price.to_s + shop.sell_currency if shop.sell_price && shop.sell_currency
  end

  def location
    "#{shop.world.capitalize} #{shop.location_x}, #{shop.location_y}, #{shop.location_z}"
  end

  def as_json(options = {})
    shop.as_json(options).merge(
      item_block_id: shop.item.block_id
    )
  end

  def to_json(options = {})
    as_json(options).to_json
  end
end
