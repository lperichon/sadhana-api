class PracticeTechniqueSerializer < ActiveModel::Serializer
  attributes :id,
  			 :position
  has_one :technique, include: false
end
