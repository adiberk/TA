class ChatController < ApplicationController
  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])

  	@user = current_user
  	@course_list = @user.courses
  	@ta_list = Array.new

  	@course_list.each do |course|
  		course.tas.each do |ta|
  			@ta_list.push(ta)
  		end
  	end

	@ta_list = @ta_list.uniq


	@student_list = Array.new
	@course_list.each do |course|
		course.enrollments.each do |e|
			if e.user_id == current_user.id
				#skip
			else
				@student_list.push(@users.find(e.user_id))
			end
		end
	end

	@student_list = @student_list.uniq

  end



end
