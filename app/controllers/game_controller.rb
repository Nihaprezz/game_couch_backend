class GameController < ApplicationController
    require 'rest-client'
    skip_before_action :authorized 

    def popular
        today = Date.today.strftime("%Y-%m-%d")
        url = `https://api.rawg.io/api/games?dates=#{today},2019-12-31&ordering=-added`
    end

    def justReleased
        url = `https://api.rawg.io/api/games?dates=2019-09-01,2019-09-30&platforms=18,1,7`
    end

end
