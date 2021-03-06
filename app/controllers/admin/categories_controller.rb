class Admin::CategoriesController < Admin::AdminController

  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @categories = Category.order(:name)
  end

  def create
    @category = Category.new(category_params)
    @categories = Category.order(:name)
    if @category.save
      redirect_to admin_categories_path, success: t('categories.controller.create.success')
    else
      flash.now[:danger] = t('categories.controller.create.danger')
      render :new
    end
  end

  def edit
    @categories = Category.where("id != #{@category.id}").order(:name)
  end

  def update
    @categories = Category.where("id != #{@category.id}").order(:name)
    if @category.update(category_params)
      redirect_to admin_categories_path, success: t('categories.controller.update.success')
    else
      flash.now[:danger] = t('categories.controller.update.danger')
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, success: t('categories.controller.destroy.success')
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
