class PracticeTechniqueSerializer < ActiveModel::Serializer
  embed :ids, :include => true
  attributes :id,
  			 :position
  has_one :practice_part
end
