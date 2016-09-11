class ShopSerializer < ActiveModel::Serializer
  attributes :id, :output_item_name, :output_amount,
      :input_item_name, :input_amount, :server_address, :world_uuid, :which,
      :location_x, :location_y, :location_z, :exchanges_available

  has_one :input_item
  has_one :output_item
end
