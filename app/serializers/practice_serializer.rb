class PracticeSerializer < ActiveModel::Serializer
  attributes :id,
  			 :name,
  			 :description,
  			 :continuous,
  			 :delay
  has_many :practice_parts
end
