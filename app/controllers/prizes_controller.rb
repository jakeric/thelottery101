class PrizesController < ApplicationController
  def index
    @prizes = Prize.all
  end

  def show
    @prize = set_prize
  end

  def get_random_ticket
    if params[:ticket_id].nil?
      @prizes = Prize.all
      @lottery_numbers = []
      all_tickets = Ticket.all
      all_tickets.each do |los|
        @lottery_numbers << los if los.name.nil?
      end
      @random_ticket = @lottery_numbers.sample
      render "prizes/index"
    else
      @winner_ticket = Ticket.find(params[:ticket_id])
      @prizes = Prize.all
      open_prizes = Prize.where("ticket_id IS NULL")
      @random_prize = open_prizes.sample

      render "prizes/index"
      end
  end

  def save_ticket_to_prize
    @prize = set_prize
    @prize.ticket_id = params[:ticket_id]
    @prize.save

    render "prizes/show"
  end

  def destroy

    prizes_with_tickets = Prize.where("ticket_id IS NOT NULL")

      prizes_with_tickets.each do |prize|
        prize.ticket_id = nil
        prize.save!
      end
      # raise
    redirect_to prizes_path
  end

  def list
    @prizes = Prize.all
  end

  private

  def set_prize
    if params[:prize].nil? && params[:id] != (nil || "delete_all_tickets")
      @prize = Prize.find(params[:id])
    else
      @prize = Prize.find(params[:prize]) if params[:prize] != nil
    end
  end

  def prize_params
    params.require(:prize).permit(:title, :ticket_id, :id, :winner_ticket_id, :winner_ticket, :prize)
  end
end
