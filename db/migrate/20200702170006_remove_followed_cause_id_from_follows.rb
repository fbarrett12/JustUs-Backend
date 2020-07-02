class RemoveFollowedCauseIdFromFollows < ActiveRecord::Migration[6.0]
  def change
    remove_column :follows, :followed_cause_id
  end
end
