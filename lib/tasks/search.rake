namespace :search do
  desc 'Reindexes all shops in MongoDB'
  task reindex: :environment do
    IndexedShop.delete_all

    Shop.find_each do |shop|
      IndexedShop.index_shop shop
    end

    Rake::Task['db:mongoid:create_indexes'].invoke
  end
end
