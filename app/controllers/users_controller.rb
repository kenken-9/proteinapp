class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @items = @user.items

    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:item_id)
    @bookmark_list = Item.find(bookmarks)
  end


end
