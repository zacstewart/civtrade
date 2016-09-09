class IndexedShop
  include Mongoid::Document
  field :shop_id,          type: Integer

  field :input_item_id,    type: Integer
  field :input_item_name,  type: Array

  field :output_item_id,   type: Integer
  field :output_item_name, type: Array

  field :location,         type: Array

  index(input_item_id: 1)
  index(input_item_name: 1)
  index(output_item_id: 1)
  index(output_item_name: 1)
  index({location: '2d'}, min: -WORLD_RADIUS, max: WORLD_RADIUS)

  def shop
    @shop ||= Shop.find(shop_id)
  end

  def self.index_shop(shop)
    index_shop = self.where(shop_id: shop.id).first_or_initialize

    index_shop.assign_attributes(
      input_item_id:    shop.input_item_id,
      input_item_name:  indexable_input_item_name(shop),
      output_item_id:   shop.output_item_id,
      output_item_name: indexable_output_item_name(shop),
      location:         [shop.location_x, shop.location_z]
    )

    index_shop.save
  end

  def self.search(q)
    query = q.downcase
    query = query.strip.split
    self.or(
      [input_item_id: query],
      [input_item_name: query],
      [output_item_id: query],
      [output_item_name: query]
    )
  end

  private

  def self.indexable_input_item_name(shop)
    (shop.input_item.present? ? shop.input_item.name : shop.input_item_name).downcase.split
  end

  def self.indexable_output_item_name(shop)
    (shop.output_item.present? ? shop.output_item.name : shop.output_item_name).downcase.split
  end
end
