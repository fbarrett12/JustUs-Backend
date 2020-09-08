class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_name, :id, :password 
end
