class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :user
      t.references :cause

      t.timestamps
    end
  end
end
