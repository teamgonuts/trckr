class AdminUsersController < ApplicationController
  before_filter :confirm_logged_in

  layout 'admin'

  def index
    list
    render('list')
  end

  def list
    @admin_users = AdminUser.sorted
  end

  def show
    user_id = params[:id]
    @admin_user = AdminUser.find(user_id.to_s)

    if @admin_user.blank?
      flash[:notice] = "Error: could not find admin with id: #{user_id}"
      redirect_to(:action => 'index')
    end
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    #creates an admin from form parameters
    @admin_user = AdminUser.new(params[:admin_user])

    if @admin_user.save
      flash[:notice] = "User created!"
      redirect_to(:action => 'show', :id => @admin_user.id)
    else
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id].to_s)
  end

  def update
    @admin_user = AdminUser.find(params[:id].to_s)
    
    #Save the object
    if @admin_user.update_attributes(params[:admin_user])
      #If save succeeds...
      flash[:notice] = "AdminUser updated successfully!"
      redirect_to(:action => 'show', :id => @admin_user.id)
    else
      #If save fails...
      render('edit') 
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id].to_s)
  end

  def destroy
    AdminUser.find(params[:id].to_s).destroy
    flash[:notice] = "Admin User destroyed successfully!"
    redirect_to(:action => 'list')
  end

end
