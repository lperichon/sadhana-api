class PracticeSerializer < ActiveModel::Serializer
  attributes :id,
  			 :name,
  			 :description
  has_many :practice_parts
end
