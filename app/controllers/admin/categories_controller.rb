class Admin::CategoriesController < AdminController
    def index
        @categories = Category.all
    end

    def new
        @new_category = Category.new
    end

    def create
        @admin_category = Category.new(admin_category_params)

        respond_to do |format|
            if @admin_category.save
                #format.html { redirect_to admin_categories_path, notice: "Category was successfully created." }
                format.html { redirect_to admin_category_url(@admin_category), notice: "Category was successfully created." }
                format.json { render :show, status: :created, location: @admin_category }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @admin_category.errors, status: :unprocessable_entity }
            end
        end
    end

    def show
        @category = Category.find(params[:id])
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        respond_to do |format|
            format.html { redirect_to admin_categories_path, notice: "Category was successfully deleted." }
        end
    end

    def edit
        @admin_category = Category.find(params[:id])
    end

    def update
        @admin_category = Category.find(params[:id])
        respond_to do |format|
            if @admin_category.update(admin_category_params)
              format.html { redirect_to admin_show_category_url(@admin_category), notice: "Category was successfully updated." }
              format.json { render :show, status: :ok, location: @admin_category }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @admin_category.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    # Only allow a list of trusted parameters through.
    def admin_category_params
        params.require(:category).permit(:name, :description, :image)
      end
end
