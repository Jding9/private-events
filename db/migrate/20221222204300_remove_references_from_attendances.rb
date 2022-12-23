class RemoveReferencesFromAttendances < ActiveRecord::Migration[6.1]
  def change
    remove_reference :attendances, :user
    remove_reference :attendances, :event
  end
end
