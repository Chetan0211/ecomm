class Admin::CategoryController < ApplicationController
    def index
        @categories = Category.all
    end
end
