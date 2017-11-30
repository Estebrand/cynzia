class PortfolioController < ApplicationController
  
	def portfolio
		@products = Product.where(category: params[:category_id])
    @category = Category.find(params[:category_id])


	end

  def portraits
  	@products = Product.where(category: params[:category_id])
    @category = Category.find(params[:category_id])
  end

  def index
  @product1 = Product.find_by(category_id: 11)
  @product2 = Product.find_by(category_id: 12)
  @product3 = Product.find_by(category_id: 13)


  @products = Product.all
   @carousel = []
  	 
     @products.each do |product|
      if product.category_id == 11 
        @carousel.push(product.image)
      end
    end

  end



end
