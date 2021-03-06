require 'machinist/active_record'

Item.blueprint do
  name { 'Iron Ingot' }
  block_id { 265 }
end

Shop.blueprint do
  item_name { 'Iron Ingot' }
  item { Item.make }
  sell_amount { Forgery::Basic.number }
  sell_price { Forgery::Basic.number }
  sell_currency { 'i' }
  buy_amount { Forgery::Basic.number }
  buy_price { Forgery::Basic.number }
  buy_currency { 'i' }
  world { 'overworld' }
  location_x { Forgery::Basic.number }
  location_y { Forgery::Basic.number }
  location_z { Forgery::Basic.number }
end

User.blueprint do
  username { Forgery::Internet.user_name }
  password { Forgery::Basic.password }
end
