module UsersHelper

	def create_header
		@days = ["sun", "mon", "tue", "wed", "thu", "fri"]
		@hours = "7:00AM-10:00PM"
		@fontFamily = "Montserrat"
		@fontColor = "black"
		@fontWeight =  "100"
		@fontSize = "0.8em"
		@hoverColor = "#727bad"
		@selectionColor = "#9aa7ee"
		@headerBackgroundColor = "transparent"
		@parsedHours = parseHours(@hours)
		dayHeaderContainer = "<div class = 'header'><div class = 'align-block'></div>"
		count = 0;
		@days.each do |day|
			dayHeaderContainer = dayHeaderContainer +  "<div class = 'header-item #{day}-header'><h3 class = 'day-titles'>#{day.upcase}</h3></div>"
		end
		dayHeaderContainer += "</div>"
		return dayHeaderContainer.html_safe
	end
	def create_cal(course)
		@days = ["sun", "mon", "tue", "wed", "thu", "fri"]
		@hours = "7:00AM-10:00PM"
		@fontFamily = "Montserrat"
		@fontColor = "black"
		@fontWeight =  "100"
		@fontSize = "0.8em"
		@hoverColor = "#727bad"
		@selectionColor = "#9aa7ee"
		@headerBackgroundColor = "transparent"
		@parsedHours = parseHours(@hours)
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
			correct_hour = nil;
			officehours.each do |offh|
				if (offh.start.strftime('%l:%M%p').split(" ")[0].eql?(@parsedHours[count]))
					correct_hour = offh
				end
			end
			byebug
			(0..@parsedHours.length-1).each do |jcount|
				if correct_hour!=nil
					hour = "<div class = 'hour #{@parsedHours[jcount]}', id = 'cal-table'><div class = 'time-added'>#{User.find(correct_hour.ta_id).first_name}</div></div>"
				else
					hour = "<div class = 'hour #{@parsedHours[jcount]}', id = 'cal-table'></div>"
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

		startHour = 0
		if split[0].include?("PM")
			startHour = startInt+12
		end
		endHour = 0
		if split[1].include?("PM")
			endHour = endInt+12;
		end
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
            curHour+=1
            output.push(parsedStr)
		end
        return output;
	end

	def capitalize(string)
		return string.charAt(0).upcase + string.slice!(0)
	end


end
