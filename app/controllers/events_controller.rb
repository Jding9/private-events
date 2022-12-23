class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    
    def new
        @event = Event.new(event_name: "...", event_date:"...")
    end

    def attend
        @event = Event.find(params[:id])

        attend_event = Attendance.new(attendee_id: current_user.id, attended_event_id: @event.id)
        if attend_event.save
            redirect_to @event, notice: "You are now attending the event"
        else
            redirect_to @event, notice: "Error, event not attended"
        end
    end

    def create
        @event = current_user.created_events.build(event_params)

        if @event.save
            redirect_to @event
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    private

    def event_params
        params.require(:event).permit(:created_at, :updated_at, :event_date, :event_name)
    end
end
