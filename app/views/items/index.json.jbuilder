json.array! @items do |item|
  json.block_id item.block_id
  json.name item.name
end
