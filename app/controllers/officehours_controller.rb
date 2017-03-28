class OfficehoursController < ApplicationController
  before_action :set_officehour, only: [:show, :edit, :update, :destroy]

  # GET /officehours
  # GET /officehours.json
  def index
    @officehours = Officehour.all
  end

  # GET /officehours/1
  # GET /officehours/1.json
  def show
  end

  # GET /officehours/new
  def new
    @officehour = Officehour.new
  end

  # GET /officehours/1/edit
  def edit
  end

  # POST /officehours
  # POST /officehours.json
  def create
    @officehour = Officehour.new(officehour_params)

    respond_to do |format|
      if @officehour.save
        format.html { redirect_to @officehour, notice: 'Officehour was successfully created.' }
        format.json { render :show, status: :created, location: @officehour }
      else
        format.html { render :new }
        format.json { render json: @officehour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /officehours/1
  # PATCH/PUT /officehours/1.json
  def update
    respond_to do |format|
      if @officehour.update(officehour_params)
        format.html { redirect_to @officehour, notice: 'Officehour was successfully updated.' }
        format.json { render :show, status: :ok, location: @officehour }
      else
        format.html { render :edit }
        format.json { render json: @officehour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /officehours/1
  # DELETE /officehours/1.json
  def destroy
    @officehour.destroy
    respond_to do |format|
      format.html { redirect_to officehours_url, notice: 'Officehour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_officehour
      @officehour = Officehour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def officehour_params
      params.require(:officehour).permit(:course_id, :ta_id, :start, :end, :online)
    end
end
