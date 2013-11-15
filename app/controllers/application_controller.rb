class ApplicationController < ActionController::Base
  layout 'root'
	
	before_filter :current_user
  before_filter :authorize, :only => [:edit,:new,:show,:index]
  helper :all
  
  def authorize
    unless Employee.find_by_id(session[:employee_id])
      flash[:notice] = 'Please login'
      redirect_to '/login'
    end
  end
  
  def auth
    if request
      employee = Employee.authenticate(params[:username], params[:password])
      if employee
        session[:employee_id] = employee.id
        flash[:notice] = 'Welcome ' + employee.name + '!'
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
