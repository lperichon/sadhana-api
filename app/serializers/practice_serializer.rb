class PracticeSerializer < ActiveModel::Serializer
  embed :ids, :include => true
  attributes :id,
  			 :name,
  			 :description
  has_many :practice_parts
end
