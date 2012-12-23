class Pledge < ActiveRecord::Base
  belongs_to :bounty, counter_cache: true
  belongs_to :user
  has_many :evidences

  AMOUNT_PATTERN = %r((\d+)([#{CURRENCIES.join}]))

  def amount=(amt, *args)
    super
    if amt && match = amt.match(AMOUNT_PATTERN)
      self.amount_value = match[1]
      self.amount_currency = match[2]
    end
  end
end
