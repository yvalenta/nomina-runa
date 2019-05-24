class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :identification, :role, :email
end
