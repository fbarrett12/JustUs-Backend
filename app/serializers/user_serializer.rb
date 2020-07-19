class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id 
  has_many :causes
end
