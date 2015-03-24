class PracticePartSerializer < ActiveModel::Serializer
  attributes :id,
  			 :position
  has_one :part, include: false
  has_many :practice_techniques
end
