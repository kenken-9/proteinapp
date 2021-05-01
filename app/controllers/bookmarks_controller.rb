class BookmarksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_item

    def create
        @bookmark = Bookmark.new(user_id: current_user.id , item_id: @item.id)
        @bookmark.save
    end

    def destroy
        @bookmark = Bookmark.find_by(user_id: current_user.id, item_id: @item.id)
        @bookmark.destroy
    end

    def set_item
        @item = Item.find(params[:item_id])
    end

end
