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

  def create
    #Create a new Item Object using form parameters
    @item = Item.new(params[:item])

    #Save the object
    if @item.save
      #If save succeeds...
      redirect_to(:action => 'show', :id => @item.id)
    else
      #If save fails...
      render('new') #will automatically repopulate forms
    end

  end

end
