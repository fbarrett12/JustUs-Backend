class User < ApplicationRecord
    has_secure_password
    validates :user_name, uniqueness: true
    validates :password,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? }

    has_many :causes
    has_many :follows
    has_many :causes, through: :follows
end
