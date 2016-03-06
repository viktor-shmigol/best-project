class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :token, :full_name, :first_name, :last_name
end
