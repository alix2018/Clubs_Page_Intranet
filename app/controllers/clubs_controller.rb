class ClubsController < ApplicationController

  def news
  end

  def list
  end

  def subscribe
  end

  def join
    @clubs = Club.all
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

  def profile
  end

  def article
  end

  private


  def clubs_params
    params.require(:club).permit(:name, :website, :description)
  end

end
