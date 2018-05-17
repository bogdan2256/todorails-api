class SessionSerializer < ActiveModel::Serializer
  attributes :username, :token, :full_name
end
