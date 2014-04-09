class PracticePartSerializer < ActiveModel::Serializer
  embed :ids, :include => true
  attributes :id,
  			 :position
  has_one :part
end
