class PracticeTechniqueSerializer < ActiveModel::Serializer
  attributes :id,
  			 :position,
  			 :minutes,
  			 :seconds,
  			 :compensate
  has_one :technique, include: false
end
