class BooksController < ApplicationController
    def edit
    end

    def update
    end

    #投稿データの保存
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            redirect_to books_path
        else
            render :new
        end
    end

    def index
        @user = current_user
        @newbook = Book.new
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
        @user = @book.user
        @newbook = Book.new
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    # 投稿データのストロングパラメータ
    private

    def book_params
        params.require(:book).permit(:title, :body)
    end
end
