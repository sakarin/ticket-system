class PrototypesController < ApplicationController
  # GET /prototypes
  # GET /prototypes.json
  def index

    @search = Prototype.with_company(current_user).search(params[:q])
    @prototypes = @search.result.paginate(:page => params[:page], :per_page => 20)

  end

  # GET /prototypes/1
  # GET /prototypes/1.json
  def show
    @prototype = Prototype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prototype }
    end
  end

  # GET /prototypes/new
  # GET /prototypes/new.json
  def new
    @prototype = Prototype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prototype }
    end
  end

  # GET /prototypes/1/edit
  def edit
    @prototype = Prototype.find(params[:id])
  end

  # POST /prototypes
  # POST /prototypes.json
  def create
    @prototype = Prototype.new(params[:prototype])

    @prototype.company_id = current_user.company.id unless current_user.company.nil?


    respond_to do |format|
      if @prototype.save
        format.html { redirect_to activities_url, notice: I18n.t('activerecord.successful.messages.created', :model => @prototype.class.model_name.human) }
        format.json { render json: @prototype, status: :created, location: @prototype }
      else
        format.html { render action: "new" }
        format.json { render json: @prototype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prototypes/1
  # PUT /prototypes/1.json
  def update
    @prototype = Prototype.find(params[:id])
    @prototype.company_id = current_user.company.id unless current_user.company.nil?

    respond_to do |format|
      if @prototype.update_attributes(params[:prototype])
        format.html { redirect_to activities_url, notice: I18n.t('activerecord.successful.messages.updated', :model => @prototype.class.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prototype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prototypes/1
  # DELETE /prototypes/1.json
  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy

    respond_to do |format|
      format.html { redirect_to prototypes_url }
      format.json { head :no_content }
    end
  end
end
