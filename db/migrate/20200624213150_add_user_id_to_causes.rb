class AddUserIdToCauses < ActiveRecord::Migration[6.0]
  def change
    :causes, :user_id, :integer
  end
end
