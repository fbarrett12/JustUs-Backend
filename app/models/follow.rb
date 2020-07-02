class Follow < ApplicationRecord
    belongs_to :users
    belongs_to :causes
end
