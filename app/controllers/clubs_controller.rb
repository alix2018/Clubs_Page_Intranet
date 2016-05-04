class ClubsController < ApplicationController

  def news
  end

  def list
    @clubs = Club.all 
  end

  def list_private
    @clubs =Club.all
  end

  def subscribe
  end

  def new_article
    #@club_users= Clubs_users.all
    #if @club_users.user_id==current_user.id
      #@clubs = Clubs_users.where(user_id: params[:id]).where(club_id: params[:id])
    #end
    @clubs=Club.all
    @article=Article.new
  end

  def create_article
    @article=Article.new(articles_params)
    if @club.save
      redirect_to root_path
    else
      render :new
    end
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
    @inscription = Clubs_users.new
    @inscription.club_id = @club.id
    @inscription.user_id = current_user.id;
    @inscription.admin = true;
    @inscription.valide = true;
    @inscription.save
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
