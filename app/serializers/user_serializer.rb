class UserSerializer < ApplicationSerializer
  type 'users'

  attributes :id, :name, :last_name, :created_at, :updated_at
end
