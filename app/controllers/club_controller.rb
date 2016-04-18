class ClubController < ApplicationController

  def index
    $cur_prom= current_user.promo
  end

  def mesclubs
    $cur_prom= current_user.promo
  end

   def touslesclubs
    $cur_prom= current_user.promo
  end

    def creerclub
    $cur_prom= current_user.promo
  end

end
