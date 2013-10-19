class PasswordsController < ApplicationController
  # GET /passwords
  # GET /passwords.xml
  def index
    @passwords = current_user.passwords

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @passwords }
    end
  end

  # GET /passwords/1
  # GET /passwords/1.xml
  def show
    @password = Password.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @password }
    end
  end

  # GET /passwords/new
  # GET /passwords/new.xml
  def new
    @password = Password.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @password }
    end
  end

  # GET /passwords/1/edit
  def edit
    @password = Password.find(params[:id])
  end

  # POST /passwords
  # POST /passwords.xml
  def create
    @password = Password.new(params[:password])

    respond_to do |format|
      if @password.save
        format.html { redirect_to(@password, :notice => 'Password was successfully created.') }
        format.xml  { render :xml => @password, :status => :created, :location => @password }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @password.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /passwords/1
  # PUT /passwords/1.xml
  def update
    @password = Password.find(params[:id])

    respond_to do |format|
      if @password.update_attributes(params[:password])
        format.html { redirect_to(@password, :notice => 'Password was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @password.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /passwords/1
  # DELETE /passwords/1.xml
  def destroy
    @password = Password.find(params[:id])
    @password.destroy

    respond_to do |format|
      format.html { redirect_to(passwords_url) }
      format.xml  { head :ok }
    end
  end
end
