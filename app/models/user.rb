class User < ApplicationRecord
    has_many :causes
    has_many :follows
    has_many :causes, through: :follows
end
