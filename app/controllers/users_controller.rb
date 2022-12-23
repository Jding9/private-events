class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @attended_events = current_user.attended_events
    end

    def index
        @user = User.all
    end
end
