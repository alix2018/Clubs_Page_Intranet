class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all 
  end

  def list_private
    @clubs = Club.joins(:inscriptions).where("inscriptions.user_id" => current_user.id)
    render "index"
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    @club = Club.find(params[:id])
    @admin = current_user.is_admin_of?(@club)
  end

  def article
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
    @users = User.all.where.not(id: current_user.id)
  end

  # POST /clubs
  # POST /clubs.json
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

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update    
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clubs_params
      params.require(:club).permit(:name, :website, :description, :logo)
    end

    def users_params
      params.require(:user).permit(:name, :lastname)
    end
end
