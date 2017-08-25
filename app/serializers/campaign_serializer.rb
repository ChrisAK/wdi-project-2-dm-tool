class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name, :scheduled_day
  has_one :user
end
