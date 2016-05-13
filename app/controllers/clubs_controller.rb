class ClubsController < ApplicationController

  public

  def index
    @clubs = Club.all 
  end

  def list_private
    @clubs = Club.joins(:inscriptions).where("inscriptions.user_id" => current_user.id)
    render "index"
  end

  def new
     @club = Club.new
  end

  def create
    @club = Club.new(clubs_params)
    @club.president = current_user.name;
    if @club.save
      redirect_to articles_path
      flash[:notice] = "Le club a été créé. Congratulations!!!"
    else
      render :new
      flash[:error] = "Le club n'a pas été créé."
    end
    @inscription = Inscription.new
    @inscription.club_id = @club.id
    @inscription.user_id = current_user.id;
    @inscription.admin = true;
    @inscription.valide = true;
    @inscription.save
      end

  def article
  end

  def show
    @club = Club.find(params[:id])
    @admin = current_user.is_admin_of?(@club)
  end

  private


  def clubs_params
    params.require(:club).permit(:name, :website, :description, :logo)
  end

end
