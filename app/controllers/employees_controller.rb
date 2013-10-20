class EmployeesController < ApplicationController
	layout 'application'

	def index
    @employees = Employee.find(:all)
  end

  def create
    params[:employee]
    @employee = Employee.new(params[:employee])
    if @employee.save
      flash[:notice] = "Employee #{@employee.name} created!"
      redirect_to(employee_url(@employee))
    else
      render :action => 'index'
    end
  end
  
  def show
    @employee = Employee.find(params[:id])
    @passwords = @employee.passwords
  end
  
  def new
  	@employee = Employee.new
  end
  
  def download
    send_file ('/Volumes/data/Users/zachtaylor/Sites' + params[:filename])
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
    
    if @employee.update_attributes(params[:employee])
      flash[:notice] = "#{@employee.name}"
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to(employees_url)
  end
  
  
	
end
