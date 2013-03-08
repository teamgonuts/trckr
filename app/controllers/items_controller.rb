class ItemsController < ApplicationController

  #index defaults to list action
  def index
    list #calls list action
    render('list') #renders list action
  end


  def list
    @items = Item.order("items.id ASC")
  end

  def show
    @item = Item.find(params[:id])
  end

  #register a new item
  def new
    @item = Item.new
  end
end
