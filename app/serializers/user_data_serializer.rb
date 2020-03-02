class UserDataSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :gender, :phone, :config

  def config
    UserConfigSerializer.new object.config 
  end

end
