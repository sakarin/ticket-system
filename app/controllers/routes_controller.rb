class RoutesController < ApplicationController
  # GET /routes
  # GET /routes.json

  def index
    @search = Route.search(params[:q])
    @routes = @search.result.paginate(:page => params[:page], :per_page => 20).order('departure DESC')

  end

  def show
    @route = Route.find(params[:id])
  end

  # GET /routes/new
  # GET /routes/new.json
  def new
    @route = Route.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/1/edit
  def edit
    @route = Route.find(params[:id])
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = Route.new(params[:route])

    @route.company_id = current_user.company.id unless current_user.company.nil?

    respond_to do |format|
      if @route.save
        format.html { redirect_to routes_path, notice: I18n.t('activerecord.successful.messages.created', :model => @route.class.model_name.human) }
        format.json { render json: @route, status: :created, location: @route }
      else
        format.html { render action: "new" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routes/1
  # PUT /routes/1.json
  def update
    @route = Route.find(params[:id])

    respond_to do |format|
      if @route.update_attributes(params[:route])
        format.html { redirect_to routes_path, notice: I18n.t('activerecord.successful.messages.updated', :model => @route.class.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route = Route.find(params[:id])
    @route.destroy

    respond_to do |format|
      format.html { redirect_to routes_url }
      format.json { head :no_content }
    end
  end


  def prototype
    @route = Route.new

  end

  def clone
    @prototype = Prototype.find(params[:route][:prototype_id])
    @routes = @prototype.routes
    @routes.each do |route|
       route.duplicate(params[:route][:date])
    end


    redirect_to routes_path, notice: 'Route was successfully created.'
  end
end
