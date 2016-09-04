require 'json'

def create_or_update_item(data)
  type = data.fetch('type')
  meta = data.fetch('meta')

  block_id = if meta == 0
               type.to_s
             else
               "#{type}:#{meta}"
             end
  name = data.fetch('name')

  puts "   -> #{block_id} - #{name}"
  Item.where(block_id: block_id).first_or_initialize.tap do |item|
    item.name = name
    item.save!
  end
end

puts '-- Loading Minecraft items'
JSON.parse(File.read('db/items.json')).each do |data|
  create_or_update_item(data)
end
