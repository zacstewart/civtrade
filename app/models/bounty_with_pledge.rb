class BountyWithPledge
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include Virtus

  attribute :user     # posting user
  attribute :username # wanted person
  attribute :amount
  attribute :comment

  attr_reader :bounty

  validates :user, :username, :amount, :comment, presence: true

  def initialize(*args)
    super
    @bounty = Bounty.for_username(username).first_or_initialize
    @pledge = @bounty.pledges.build(user: user, amount: amount, comment: comment)
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
