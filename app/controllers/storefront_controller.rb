class StorefrontController < ApplicationController
 
  def all_items
  	@products = Product.all
  end

  def items_by_category
    @products = Product.where(category: params[:category_id])
    @category = Category.find(params[:category_id])
  end

  def items_by_brand
    @products = Product.where(brand: params[:brand])
    @brand = params[:brand]
  end

  def feature
   # Make Array
    @products = Product.all
     @carousel = []
  	 
     @products.each do |product|
    
        if product.category_id == 11 
          @carousel.push(product.image)
        end
      end
      # puts "-------------"
      # puts @carousel
      # puts "--------------"




  end

end
