class BooksController < ApplicationController
    def edit
        if Book.find(params[:id]).user_id == current_user.id
            @book =Book.find(params[:id])
        else
            redirect_to books_path
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to book_path(@book), notice: 'Book was successfully updated.'
        else
            @newbook = @book
            @user = current_user
            @books = Book.all
            render :index
        end
    end

    #投稿データの保存
    def create
        @newbook = Book.new(book_params)
        @newbook.user_id = current_user.id
        if @newbook.save
            redirect_to book_path(@newbook), notice: 'Book was successfully created'
        else
            @user = current_user
            @books = Book.all
            render :index
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
