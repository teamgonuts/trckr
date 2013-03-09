class ItemsController < ApplicationController


  #index defaults to list action
  def index
    list #calls list action
    render('list') #renders list action
  end


  def list
    @items = Item.order("items.created_at DESC")
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
      flash[:notice] = "Item registered successfully!"
      redirect_to(:action => 'show', :id => @item.id)
    else
      #If save fails...
      render('new') #will automatically repopulate forms
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  #TODO: make sure when you update uid that it is still unique!
  def update
    #Update a new Item Object using form parameters
    @item = Item.find(params[:id])
    
    #Save the object
    if @item.update_attributes(params[:item])
      #If save succeeds...
      flash[:notice] = "Item updated successfully!"
      redirect_to(:action => 'show', :id => @item.id)
    else
      #If save fails...
      render('edit') 
    end
  end

  def delete
    @item = Item.find(params[:id])
  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:notice] = "Item destroyed successfully!"
    redirect_to(:action => 'list')
  end
end
