class RetireesController < ApplicationController
  # GET /retirees
  # GET /retirees.xml
  def index
   # @retirees = Retiree.all
    @retirees = Retiree.paginate(:page => params[:page], :per_page => 5)
    @title = "Retiree wisdom"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @retirees }
    end
  end

  # GET /retirees/1
  # GET /retirees/1.xml
  def show
    @retiree = Retiree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @retiree }
    end
  end

  # GET /retirees/new
  # GET /retirees/new.xml
  def new
    @retiree = Retiree.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @retiree }
    end
  end

  # GET /retirees/1/edit
  def edit
    @retiree = Retiree.find(params[:id])
  end

  # POST /retirees
  # POST /retirees.xml
  def create
    @retiree = Retiree.new(params[:retiree])

    respond_to do |format|
      if @retiree.save
        format.html { redirect_to(@retiree, :notice => 'Retiree was successfully created.') }
        format.xml  { render :xml => @retiree, :status => :created, :location => @retiree }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @retiree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /retirees/1
  # PUT /retirees/1.xml
  def update
    @retiree = Retiree.find(params[:id])

    respond_to do |format|
      if @retiree.update_attributes(params[:retiree])
        format.html { redirect_to(@retiree, :notice => 'Retiree was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @retiree.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /retirees/1
  # DELETE /retirees/1.xml
  def destroy
    @retiree = Retiree.find(params[:id])
    @retiree.destroy

    respond_to do |format|
      format.html { redirect_to(retirees_url) }
      format.xml  { head :ok }
    end
  end
end
