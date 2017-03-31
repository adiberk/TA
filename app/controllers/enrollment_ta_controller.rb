class EnrollmentTaController < ApplicationController
  before_action :set_enrollment_ta, only: [:show, :edit, :update, :destroy]

  # GET /enrollment_ta
  # GET /enrollment_ta.json
  def index
    @enrollment_ta = EnrollmentTa.all
  end

  # GET /enrollment_ta/1
  # GET /enrollment_ta/1.json
  def show
  end

  # GET /enrollment_ta/new
  def new
    @enrollment_ta = EnrollmentTa.new
  end

  # GET /enrollment_ta/1/edit
  def edit
  end

  # POST /enrollment_ta
  # POST /enrollment_ta.json
  def create
    @enrollment_ta = EnrollmentTa.new(enrollment_ta_params)

    respond_to do |format|
      if @enrollment_ta.save
        format.html { redirect_to @enrollment_ta, notice: 'Enrollment ta was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment_ta }
      else
        format.html { render :new }
        format.json { render json: @enrollment_ta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollment_ta/1
  # PATCH/PUT /enrollment_ta/1.json
  def update
    respond_to do |format|
      if @enrollment_ta.update(enrollment_ta_params)
        format.html { redirect_to @enrollment_ta, notice: 'Enrollment ta was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment_ta }
      else
        format.html { render :edit }
        format.json { render json: @enrollment_ta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollment_ta/1
  # DELETE /enrollment_ta/1.json
  def destroy
    @enrollment_ta.destroy
    respond_to do |format|
      format.html { redirect_to enrollment_ta_index_url, notice: 'Enrollment ta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment_ta
      @enrollment_ta = EnrollmentTa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_ta_params
      params.require(:enrollment_ta).permit(:course_id, :user_id)
    end
end
