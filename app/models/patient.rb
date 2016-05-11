class Patient < ActiveRecord::Base
  as_enum :gender, [:not_available, :male, :female], map: :string,
          source: :gender, field: {:type => String, :default => 'not_available'}

  as_enum :status, [:initial, :referred, :treatment, :closed], map: :string, source: :status
end
