class ShopDecorator < Draper::Base
  decorates :shop

  def input_item_name
    if shop.input_item.present?
      shop.input_item.name
    else
      shop.input_item_name
    end
  end

  def output_item_name
    if shop.output_item.present?
      shop.output_item.name
    else
      shop.output_item_name
    end
  end

  def location
    "#{shop.world.capitalize} #{shop.location_x}, #{shop.location_y}, #{shop.location_z}"
  end
end
