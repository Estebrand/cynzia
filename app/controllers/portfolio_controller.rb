class PortfolioController < ApplicationController
  
  def portrait_people
  end

  def portrait_pets
  end

  def fine_art
  end

  def index

  	@products = Product.all
  end


end
