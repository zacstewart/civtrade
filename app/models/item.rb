class Item < ActiveRecord::Base
  has_many :shops

  def to_param
    block_id
  end

  def self.find_by_param(param)
    where(block_id: param).first!
  end

  def self.prefixed(term)
    where('lower(name) LIKE lower(?)', "#{term}%")
  end

  def self.named(term)
    where('lower(name) = lower(?)', term)
  end
end
