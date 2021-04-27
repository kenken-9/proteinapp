class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :taste, :price, :protein, :lipid, :amount, :impression).merge(user_id: current_user.id)
  end
end
