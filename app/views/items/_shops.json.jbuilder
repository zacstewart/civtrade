json.array! @shops do |shop|
  json.city shop.city
  json.location_x shop.location_x
  json.location_y shop.location_y
  json.location_z shop.location_z
  json.reports_count shop.reports_count
  json.buy_amount shop.buy_amount
  json.buy_currency shop.buy_currency
  json.buy_price shop.buy_price
  json.sell_amount shop.sell_amount
  json.sell_currency shop.sell_currency
  json.sell_price shop.sell_price
  json.seller_username shop.seller_username
  json.world shop.world
end
