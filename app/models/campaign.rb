class Campaign < ApplicationRecord
  include Authentication
  belongs_to :user
  has_many :encounters
end
