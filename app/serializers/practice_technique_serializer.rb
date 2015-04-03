class PracticeTechniqueSerializer < ActiveModel::Serializer
  attributes :id,
  			 :position,
  			 :minutes,
  			 :seconds
  has_one :technique, include: false
end
