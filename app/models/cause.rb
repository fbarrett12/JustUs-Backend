class Cause < ApplicationRecord
    has_many :follows
    has_many :users, through: :follows
    belongs_to :user, foreign_key: true
end
