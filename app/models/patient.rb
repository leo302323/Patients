class Patient < ActiveRecord::Base
  acts_as_paranoid

  include Redis::Objects
  counter :viewed_count

  as_enum :gender, [:not_available, :male, :female], map: :string, source: :gender

  as_enum :status, [:initial, :referred, :treatment, :closed], map: :string, source: :status

  validates :first_name, :last_name, :status, :location, presence: true
  validates :gender, inclusion: {in: [:not_available, :male, :female]}
  validates :status, inclusion: {in: [:initial, :referred, :treatment, :closed]}

  belongs_to :location

  scope :onTreatment, -> { where(status: 'treatment') }

  def mr
    "MR0000#{id}"
  end

  def full_name
    [first_name, middle_name, last_name].compact.join('.')
  end

  def age
    now = Time.now.utc.to_date
    diff = (now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1
    now.year - date_of_birth.year - diff
  end
end
