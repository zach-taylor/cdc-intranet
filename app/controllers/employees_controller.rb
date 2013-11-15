class EmployeesController < ApplicationController
	layout 'application'

	def index
    @employees = Employee.find(:all)
    @current_user = current_user
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employees }
    end
  end

  def create
    @employee = Employee.new(params[:employee])
    
    respond_to do |format|
      if @employee.save
        format.html { redirect_to(@employee, :notice => "Employee #{@employee.name} was successfully created.") }
        format.xml  { render :xml => @employee, :status => :created, :location => @employee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @employee = Employee.find(params[:id])
    @passwords = @employee.passwords
    @current_user = current_user
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee.to_xml(:include => :passwords) }
    end
  end
  
  def new
  	@employee = Employee.new
  	
  	respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
  end
  
  def profile
  	@employee = Employee.find(params[:id])
  	@current_user = current_user
  end
  
  def export
    send_file (Rails.root + params[:filename])
  end
  
  def direct_deposit
  	@employee = current_user
  end
  
  def personal_info
  	@employee= current_user
  end
  
  def contact_info
  	@employee = current_user
  end
  
  def search
  	@employees = Employee.search(params[:q])
  	@current_user = current_user
  end
  
  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
    
    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to(@employee, :notice => "#{@employee.name} successfully updated") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employee.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    
    respond_to do |format|
      format.html { redirect_to(employees_url) }
      format.xml  { head :ok }
    end
  end
  
  
	
end
