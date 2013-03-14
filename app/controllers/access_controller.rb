class AccessController < ApplicationController

  layout 'admin'
  
  def index
    menu
    render('menu')
  end

  def menu
    #dispay text & links
  end

  def login
    #login form
  end

  def attempt_login
    authorized_user = AdminUser.authenticate(params[:username], params[:password])
    if authorized_user
      #todo: mark user as logged in
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'menu')
    else
      flash[:notice] = "Invalid username/password combination"
      redirect_to(:action => 'login')
    end
  end
  
  def logout
    #todo: mark user as logged out
    flash[:notice] = "Logged out!"
    redirect_to(:action => "login")
  end
  
end
