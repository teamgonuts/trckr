class ItemsController < ApplicationController

  layout 'admin'

  def index
  end


  def list
    @items = Item.order("items.created_at DESC")
  end

  def show
    uid = params[:id]
    @item = Item.find_by_uid(uid.to_s)

    if @item.blank?
      flash[:notice] = "Error: No item exists with codename '" + uid + "'"
      redirect_to(:action => 'index')
    end
  end

  def show_helper
    uid = params[:id]
    redirect_to "/c/#{uid}"
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
      flash[:notice] = "Item registered successfully!"
      redirect_to(:action => 'show', :id => @item.uid)
    else
      #If save fails...
      render('new') #will automatically repopulate forms
    end
  end

  def edit
    @item = Item.find(params[:id].to_s)
  end

  #TODO: make sure when you update uid that it is still unique!
  def update
    #Update a new Item Object using form parameters
    @item = Item.find(params[:id].to_s)
    
    #Save the object
    if @item.update_attributes(params[:item])
      #If save succeeds...
      flash[:notice] = "Item updated successfully!"
      redirect_to(:action => 'show', :id => @item.uid)
    else
      #If save fails...
      render('edit') 
    end
  end

  def delete
    @item = Item.find(params[:id].to_s)
  end

  def destroy
    Item.find(params[:id].to_s).destroy
    flash[:notice] = "Item destroyed successfully!"
    redirect_to(:action => 'list')
  end
end
