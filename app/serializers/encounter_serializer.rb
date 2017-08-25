class EncounterSerializer < ActiveModel::Serializer
  attributes :id, :name, :CR, :books, :description
  has_one :campaign
end
