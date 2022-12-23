class RemoveUserFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_reference :events, :user, null: false, foreign_key: true
  end
end
