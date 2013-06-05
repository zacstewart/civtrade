class IndexedShop
  include Mongoid::Document
  field :shop_id,          type: Integer
  field :item_id,          type: Integer
  field :item_name,        type: Array
  field :city,             type: Array
  field :seller_username,  type: String
  field :location,         type: Array

  index(item_id: 1)
  index(item_name: 1)
  index(city: 1)
  index(seller_username: 1)
  index({location: '2d'}, min: -WORLD_RADIUS, max: WORLD_RADIUS)

  def shop
    @shop ||= Shop.find(shop_id)
  end

  def self.index_shop(shop)
    index_shop = self.where(shop_id: shop.id).first_or_initialize

    index_shop.assign_attributes(
      item_id:          shop.item_id,
      item_name:        indexable_item_name(shop),
      city:             indexable_city(shop),
      seller_username:  indexable_seller_username(shop),
      location:         [shop.location_x, shop.location_z]
    )

    index_shop.save
  end

  def self.search(query)
    query.downcase!
    self.or(
      [item_id: query],
      [item_name: query],
      [city: query],
      [seller_username: query]
    )
  end

  private

  def self.indexable_item_name(shop)
    (shop.item.present? ? shop.item.name : shop.item_name).downcase.split
  end

  def self.indexable_city(shop)
    shop.city && shop.city.downcase.split
  end

  def self.indexable_seller_username(shop)
    shop.seller_username && shop.seller_username.downcase
  end
end
