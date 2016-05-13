class EventsController < ApplicationController
	def new
		@event = Event.new
	end

	def create
		@event = Event.new(events_params)
	    if @event.save
    	 	redirect_to articles_path
    	 	flash[:notice] = "Vous avez créé l'évènement! Congratulations!!!"

    	else
      		render :new
      		flash[:error] = "Vous n'avez pas créé l'évènement!"

      	end

	end
	def events_params
    	params.require(:event).permit(:title, :date_start, :date_end)
  	end
end
