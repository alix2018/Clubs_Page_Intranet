class ClubController < ApplicationController

  def index
    $cur_prom= current_user.promo
  end

end
