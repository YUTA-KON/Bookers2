class BooksController < ApplicationController
    def new
    end

    #投稿データの保存
    def create
    end

    def index
    end

    def show
    end

    def destroy
    end

    # 投稿データのストロングパラメータ
    private

    def book_params
        params.require(:book).permit(:title, :body)
    end
end
