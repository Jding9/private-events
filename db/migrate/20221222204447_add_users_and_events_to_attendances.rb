class AddUsersAndEventsToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_reference :attendances, :attendee, foreign_key: {to_table: :users}
    add_reference :attendances, :attended_event, foreign_key: {to_table: :events}
  end
end
