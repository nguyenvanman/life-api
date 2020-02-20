class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :gender, :phone
end
