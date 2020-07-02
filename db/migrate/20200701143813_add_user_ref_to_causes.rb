class AddUserRefToCauses < ActiveRecord::Migration[6.0]
  def change
    add_reference :causes, :user, null: false, foreign_key: true
  end
end
