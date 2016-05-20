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
    @users=User.all
    @club = Club.find(params[:id])
    @admin = current_user.is_admin_of?(@club)
    #Envoi du mail de rejoindre
    @pres_email= User.find_by_id(@club.president_id).email
    @sujet= "".concat(@current_user.name).concat(" ").concat(@current_user.lastname).concat(" ").concat("aimerait rejoindre ton club").concat(" ").concat(@club.name)
    @body= "Bonjour ".concat(@club.president).concat(", \n").concat(@current_user.name).concat(" ").concat(@current_user.lastname).concat(" a exprimé la volonté de rejoindre ton club : ").concat(" ").concat(@club.name).concat(".\n")\
    .concat("Ajouts du demandeur : \n\n\n\n")
  end

  def article
  end

  def add_member
  end

  def add_user
    @inscription = Inscription.new
    @inscription.club_id = params["club_id"];
    @inscription.user_id = params["user_id"];
    @inscription.admin = false;
    @inscription.save
    redirect_to articles_path
  end

  #def elim_user
  #  @inscriptionsearch=Inscription.find(user_id: params["user_id"]).where(club_id: params["club_id"]).ids
  #  @inscription=Article.find(params[:id]); 
  #  @inscription.delete(@inscriptionsearch)
  #end
  
  def promuser
    if Inscription.all.where(user_id: current_user)
      @current = Inscription.all.where(user_id: current_user).where(club_id: "club_id").first
      @current.admin = true
    else 
      @inscription = Inscription.new
      @inscription.club_id = params["club_id"]
      @inscription.user_id = params["user_id"]
      @inscription.admin = true
      @inscription.save
      redirect_to articles_path
    end
    redirect_to articles_path
  end

    def prompres
      @inscription = Club.where(id: club_id)
      @inscription.president = params["nom"]
      @inscription.president_id = params["user_id"]
      @inscription.admin = true
      @inscription.save
      redirect_to articles_path
      redirect_to articles_path
  end


  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
    @users= User.all.where.not(id: current_user.id)
    @club = Club.find(params[:id]);
  end
  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(clubs_params)
    @club.president = current_user.name;
    @club.president_id = current_user.id;
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
      params.require(:club).permit(:name, :website, :description, :logo )
    end  
  end
