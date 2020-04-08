class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :gender, :phone, :image_url
end
