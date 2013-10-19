class ApplicationController < ActionController::Base
  layout 'application'

  # bad practice:  blacklisting is bad, whitelisting is better
  #   good = before_filter :authorize, :except => :login
  #   bad = before_filter :authorize, :only => [:edit, :delete]
  
  before_filter :authorize, :only => [:edit,:new,:show,:index]
  helper :all
  
  # vulnerability:  below method should be protected because methods in here appear
  # as instance methods in all of the controllers
  def authorize
    unless Employee.find_by_id(session[:employee_id])
      flash[:notice] = 'login'
      redirect_to '/login'
    end
  end
  
  def auth
    if request
      employee = Employee.authenticate(params[:username], params[:password])
      if employee
        session[:employee_id] = employee.id
        redirect_to '/employees'
      else
        flash.now[:notice] = 'Invalid user/pass combination'
        redirect_to '/login'
      end
    end
  end
  
  def login
  	
  end

  def logout
  	redirect_to '/login'
  end
  
  def current_user
    if session[:employee_id]
      @current_user ||= Employee.find(session[:employee_id])
    end
    @current_user
  end
  helper_method :current_user
  
end
