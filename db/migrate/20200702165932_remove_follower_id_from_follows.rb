class RemoveFollowerIdFromFollows < ActiveRecord::Migration[6.0]
  def change
    :follows, :follower_id
  end
end
