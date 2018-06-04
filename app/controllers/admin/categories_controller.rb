module Admin
  class CategoriesController < BaseController
    before_action :logged_in_user
    before_action :load_category, except: %i(index new create)

    def index
      @categories = Category.paginate page: params[:page], per_page: Settings.setting_model.page_size
    end

    def show; end

    def edit; end

    def new
      @category = Category.new
    end

    def create
      @category = Category.create category_pamrams
      if @category.save
        flash[:success] = t "create_success"
        redirect_to admin_categories_url
      else
        render :new
      end
    end

    def update
      if @category.update category_pamrams
        flash[:success] = t "update_success"
        redirect_to admin_categories_url
      else
        render :edit
      end
    end

    def destroy
      if @category.destroy
        flash[:success] = t "delete_success"
      else
        flash[:errors] = t "delete_fail"
      end
      redirect_to admin_categories_url
    end

    private

    def load_category
        @category = Category.find_by id: params[:id]
        return if @category
        flash[:danger] = t "category_not_found"
        redirect_to admin_categories_url
    end

    def category_pamrams
      params.require(:category).permit :name
    end
  end
end
