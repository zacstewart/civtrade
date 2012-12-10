class Report < ActiveRecord::Base
  belongs_to :shop, counter_cache: true
end
