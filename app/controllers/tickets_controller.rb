class TicketsController < ApplicationController

  def update
    ticket_to_update = Ticket.find(params["ticket"]["ticket_id"] )
    ticket_to_update.name = params["ticket"]["name"]
    ticket_to_update.save
    @prize = Prize.find(params["ticket"]["prize_id"])
    redirect_to prize_path(@prize)
  end

  def prize_params
    params.require(:prize).permit(:name, :ticket_id, :prize_id)
  end
end
