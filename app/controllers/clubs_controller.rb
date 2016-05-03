class ClubsController < ApplicationController

  def index
    @cur_prom= current_user.promo
  end

  def lesclubs
    @cur_prom= current_user.promo
  end

  def subscribe
    @cur_prom= current_user.promo
  end

  def rejoindreclub
    @clubs = Club.all
    @cur_prom= current_user.promo
  end

  def new
     @club = Club.new
  end

  def create
    @club = Club.new(clubs_params)
    if @club.save
      redirect_to root_path
    else
      render :new
    end
  end

  def profileclub
    @cur_prom= current_user.promo
  end

  def article
    @cur_prom= current_user.promo
  end

  private


  def clubs_params
    params.require(:club).permit(:name, :website, :description)
  end

end
