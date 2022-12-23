class AttendancesController < ApplicationController
    def new
        @event = Event.find(params[:id])
    end

    def create
        @event = Event.find(params[:id])
    end
end
