class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true

    has_many :causes
    has_many :follows
    has_many :causes, through: :follows
end
