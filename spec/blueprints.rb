require 'machinist/active_record'

Shop.blueprint do
  item { 'Iron Ingot' }
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
