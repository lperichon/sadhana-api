class TechniqueSerializer < ActiveModel::Serializer
  attributes :id,
  			 :code,
  			 :filename

  def filename
  	object.photo_file_name
  end
end
