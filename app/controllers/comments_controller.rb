class CommentsController < ApplicationController
  before_action :load_menu, :find_product

  def create
    @comment = current_user.comments.build comment_params
    respond_to do |format|
      @status = @comment.save
      @support = Supports::ProductSupport.new(@product)
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit :description, :product_id
  end

  def find_product
    @product = Product.find_by id: params[:comment][:product_id]
    return if @product
    flash[:danger] = t :not_found_product
    redirect_to root_path
  end
end
