class PledgeDecorator < Draper::Base
  decorates :pledge
  decorates_association :user
end
