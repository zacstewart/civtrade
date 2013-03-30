json.block_id @item.block_id
json.name @item.name
json.shops do
  json.partial! partial: 'shops', shops: @item.shops
end
