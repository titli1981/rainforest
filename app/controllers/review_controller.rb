class ReviewController < ApplicationController

	before_action :load_product


  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user = current_user
  	 # You could use a longer alternate syntax if it makes more sense to you
    # 
    # @review = Review.new(
    #   comment: params[:review][:comment],
    #   product_id: @product.id,
    #   user_id: current_user.id
    # )

    if @review.save
    	redirect_to products_url, notice: 'Review created successfully'
    else
    	render 'products/show'
    end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  Private

  def review_params
  	psrams.require(:review).permit(:comment, :product_id)
  end
  def load_product
  	@product = Product.find(params[:product_id])
  end

end
