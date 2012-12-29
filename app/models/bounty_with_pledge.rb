class BountyWithPledge
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Virtus

  attribute :username
  attribute :wanted_username # wanted person
  attribute :amount
  attribute :comment

  attr_reader :bounty

  validates :username, :wanted_username, :amount, :comment, presence: true

  def initialize(*args)
    super
    @bounty = Bounty.for_username(wanted_username) || Bounty.new(wanted_username: wanted_username)
    @pledge = @bounty.pledges.build(username: username, amount: amount, comment: comment)
  end

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private
  def persist!
    @bounty.save!
  end
end
