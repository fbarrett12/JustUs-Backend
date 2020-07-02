class AddCauseRefToFollows < ActiveRecord::Migration[6.0]
  def change
    add_reference :follows, :cause, null: false, foreign_key: true
  end
end
