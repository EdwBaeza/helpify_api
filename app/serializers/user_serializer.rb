class UserSerializer < JSONAPI::Serializable::Resource
  type 'users'

  attributes :id, :name, :last_name, :created_at, :updated_at
end
