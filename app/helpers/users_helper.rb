module UsersHelper
	def off_hour(officehours, count, jcount)
		# byebug
		hour = nil
		officehours.each do |offh|
			if (offh.start.strftime('%a').downcase.eql?(@days[count]))
				if(offh.start.strftime("%l:%M%p").split(" ")[0].eql?(parseHours(@hours)[jcount]))
					hour = offh
				end
			end
		end
		if hour != nil
			return hour
		else
			return nil
		end
	end

	def create_header(days)
		dayHeaderContainer = "<div class = 'header'><div class = 'align-block'></div>"
		days.each do |day|
			dayHeaderContainer = dayHeaderContainer +  "<div class = 'header-item #{day}-header'><h3 class = 'day-titles'>#{day.upcase}</h3></div>"
		end
		dayHeaderContainer += "</div>"
		return dayHeaderContainer.html_safe
	end
	def create_cal(course)
		# @days = ["sun", "mon", "tue", "wed", "thu", "fri"]
		# @hours = "7:00AM-10:00PM"
		# @fontFamily = "Montserrat"
		# @fontColor = "black"
		# @fontWeight =  "100"
		# @fontSize = "0.8em"
		# @hoverColor = "#727bad"
		# @selectionColor = "#9aa7ee"
		# @headerBackgroundColor = "transparent"
		# @parsedHours = parseHours(@hours)
		days_sched = "<div class = 'days-wrapper'><div class = 'hour-header'>"
		(0..@parsedHours.length-1).each do |count|
			hour_header = "<div class = 'hour-header-item #{@parsedHours[count]}'><h5 class = 'time-slots'>#{@parsedHours[count]}</h5></div>"
			days_sched = days_sched + hour_header
		end
		days_sched = days_sched+"</div>"
		# days-wrapper is still open
		(0..@days.length-1).each do |count|
			day = "<div class = 'day #{@days[count]}'>"
			officehours = course.officehours
			# byebug
			correct_hour = nil;
			# found = false
			(0..@parsedHours.length-1).each do |jcount|
				officehours.each do |offh|
					if (offh.start.strftime('%a').downcase.eql?(@days[count]))
						# byebug
						if(offh.start.strftime('%l:%M%p').split(" ")[0].eql?(@parsedHours[jcount]))
							# byebug
							correct_hour = offh
							# found = true
						end
					end
				end
				if correct_hour!=nil
					# hour = "<div class = 'hour #{@parsedHours[jcount]}', id = 'cal-table'><div class = 'time-added'>#{User.find(correct_hour.ta_id).first_name}</div></div>"
					hour = "<div class = 'hour #{@parsedHours[jcount]}', id = 'cal-table'><div class = 'time-added'><button type='button' id ='modal_btn' style = 'display:none' data-toggle='modal' data-target='#myModal'></button>#{create_modal}<h4 class = 'offhour'>#{User.find(correct_hour.ta_id).first_name}</h4></div></div>"

					correct_hour = nil
				else
					# hour = "<div class = 'hour #{@parsedHours[jcount]}', id = 'cal-table'></div>"
					hour = "<div class = 'hour #{@parsedHours[jcount]}', id = 'cal-table'><div class = 'time-added'><button type='button' id ='modal_btn' style = 'display:none' data-toggle='modal' data-target='#myModal'></button>#{create_modal}</div></div>"
				end
				day = day + hour
			end
			days_sched = days_sched + day + "</div>"

		end
		days_sched+= "</div>"
		return days_sched.html_safe
	end

	def parseHours(string)
		output = []
		split = string.upcase.split("-")
		startInt = Integer(split[0].split(":")[0])
		endInt = Integer(split[1].split(":")[0])
		# byebug

		startHour = 0
		if split[0].include?("PM")
			startHour = startInt+12
			# byebug
		else
			startHour = startInt
		end
		endHour = 0
		if split[1].include?("PM")
			endHour = endInt+12;
			# byebug
		end
		# byebug
		curHour = startHour
		count = 0
		while curHour <= endHour
			parsedStr = ''

			if (curHour > 12) 
				if (count  == 0)
			        parsedStr += (curHour-12).to_s + ":00PM"
			        count = 1
			  else
		    	parsedStr += (curHour-12).to_s+ ":30PM"
          count = 0
				end
      elsif curHour == 12
        parsedStr += curHour.to_s + ":00PM"
      else
				if (count  == 0)
    	    parsedStr += (curHour).to_s + ":00AM"
    	    count = 1 	
      	else
    	    parsedStr += (curHour).to_s + ":30AM"
    	    count = 0
				end
			end
			if count == 0
				curHour+=1
			end
      # curHour+=1
      output.push(parsedStr)
		end
    return output;
	end

	def capitalize(string)
		return string.charAt(0).upcase + string.slice!(0)
	end

	def create_modal()
		str = "<div class='modal fade' id='myModal' role='dialog'>
			  <div class='modal-dialog'>
			  
			    <!-- Modal content-->
			    <div class='modal-content'>
			      <div class='modal-header'>
			        <button type='button' class='close' data-dismiss='modal'>&times;</button>
			        <h4 class='modal-title'>Modal Header</h4>
			      </div>
			      <div class='modal-body'>
			        <p>Some text in the modal.</p>
			      </div>
			      <div class='modal-footer'>
			        <button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>
			      </div>
			    </div>
			    
			  </div>
			</div>"
		str.html_safe
	end

	def create_modal_form()

	end

end
