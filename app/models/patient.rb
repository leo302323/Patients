class Patient < ActiveRecord::Base
  acts_as_paranoid

  include Redis::Objects
  counter :viewed_count

  as_enum :gender, [:not_available, :male, :female], map: :string, source: :gender

  as_enum :status, [:initial, :referred, :treatment, :closed], map: :string, source: :status

  validates :first_name, :last_name, :status, presence: true
  validates :gender, inclusion: {in: %w(not_available male female)}
  validates :status, inclusion: {in: %w(initial referred treatment closed)}

  belongs_to :location

  scope :onTreatment, -> { where(status: 'treatment') }

  def MR
    "MR0000#{id}"
  end
end
