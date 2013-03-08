class ItemsController < ApplicationController

  def list
    @items = Item.order("items.id ASC")
  end
end
