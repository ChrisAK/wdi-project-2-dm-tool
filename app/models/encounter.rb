class Encounter < ApplicationRecord
  include Authentication
  belongs_to :campaign
end
