class HomepageController < ApplicationController

  def index
    @rand_number = rand(100000)
  end

  def search
   @rand_number = rand(10000)

    respond_to do |format|
      format.js
    end

  end
end
