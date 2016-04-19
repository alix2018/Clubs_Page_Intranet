class ClubController < ApplicationController

  def index
    $cur_prom= current_user.promo
  end

  def lesclubs
    $cur_prom= current_user.promo
  end

    def subscribe
    $cur_prom= current_user.promo
  end

end
