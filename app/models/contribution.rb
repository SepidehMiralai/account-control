class Contribution < Transaction
  validates :number, presence: true, uniqueness: true
  validate :check_eligibility

  def check_eligibility
    errors.add :receiver, "You can only make contributions to a Parent Account" unless receiver.type == 'Account'
  end
end
