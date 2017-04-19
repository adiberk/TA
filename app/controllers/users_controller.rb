class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def taprofile

    ta_id=params[:ta_id]

    # after submit the new reviews
    # score = params[:score]
    # course_id = params[:course_id]
    # ta_id = params[:ta_id]
    # user_id = params[:user_id]
    # review = params[:review]
    # print "**********************"
    # print score
    # print course_id
    # print ta_id
    # print user_id
    # print review
    # if user_id != nil
    #   print "=============="
    #   print score
    #   print course_id
    #   print ta_id
    #   print user_id
    #   print review
    #
    #
    #   Review.create!(ta_id: ta_id, student_id:user_id, course_id: course_id, review: review, score: score)

    #end
    # current user who log in
    if logged_in?

        @current_user ||= User.find_by(id: session[:user_id])
        @user = User.find(id=ta_id)
        @courses = Course.all

    else
        redirect_to login_path
    end
  end

  def taprofile_update
    # after submit the new reviews
    score = params[:score]
    course_id = params[:course_id]
    ta_id = params[:ta_id]
    user_id = params[:user_id]
    review = params[:review]

    Review.create(ta_id: ta_id, student_id:user_id, course_id: course_id, review: review, score: score)

    @current_user ||= User.find_by(id: session[:user_id])
    @user = User.find(id=ta_id)
    @courses = Course.all
    render 'taprofile'

  end




  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @courses = Course.all
    @days = ["sun", "mon", "tue", "wed", "thu", "fri"]
    @hours = "8:00AM-8:00PM"
    @fontFamily = "Montserrat"
    @fontColor = "black"
    @fontWeight =  "100"
    @fontSize = "0.8em"
    @hoverColor = "#727bad"
    @selectionColor = "#9aa7ee"
    @headerBackgroundColor = "transparent"
    # debugger
  end

  # GET /users/new
  def new
    @user = User.new
  end
  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        flash[:success] = "User was successfully created."
        # redirect_to @user
        format.html { redirect_to @user}
        format.json { render :show, status: :created, location: @user }
      else
        # render 'new'
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end
