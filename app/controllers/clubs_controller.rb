    class ClubsController < ApplicationController

  def index
    @clubs = Club.all 
  end

  def list_private
    @clubs = Club.joins(:inscriptions).where("inscriptions.user_id" => current_user.id)
    render "index"
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
      redirect_to articles_path
    else
      render :new
    end
    @inscription = Inscription.new
    @inscription.club_id = @club.id
    @inscription.user_id = current_user.id;
    @inscription.admin = true;
    @inscription.valide = true;
    @inscription.save
    flash[:notice] = "Le club a été créé. Congratulations!!!"
  end

  def article
  end

  def show
    @club = Club.find(params[:id])
  end

  private


  def clubs_params
    params.require(:club).permit(:name, :website, :description, :logo)
  end

end
