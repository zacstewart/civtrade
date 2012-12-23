class BountyDecorator < Draper::Base
  decorates :bounty
  decorates_association :pledges
end
