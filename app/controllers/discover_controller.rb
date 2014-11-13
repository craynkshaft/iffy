class DiscoverController < ApplicationController

	def index
		@time = Time.now
		@pretty_time = Time.now.strftime('%l:%M%P')
		@hour = @time.hour
		@minute = @time.min
		@day = @time.strftime('%A')
		@abbr_day = @time.strftime('%a')
		@moods = Mood.all

		case @hour
		when 5..7
			@daypart = Daypart.find_by(name: 'early morning')
		when 8..9
			@daypart = Daypart.find_by(name: 'morning')
		when 10
			@daypart = Daypart.find_by(name: 'late morning')
		when 11..12
			@daypart = Daypart.find_by(name: 'midday')
		when 13..15
			@daypart = Daypart.find_by(name: 'early afternoon')
		when 16..17
			@daypart = Daypart.find_by(name: 'late afternoon')
		when 18..19
			@daypart = Daypart.find_by(name: 'early evening')
		when 20..21
			@daypart = Daypart.find_by(name: 'night')
		when 22..23
			@daypart = Daypart.find_by(name: 'late night')
		when 0..2
			@daypart = Daypart.find_by(name: 'overnight')
		else
			@daypart = Daypart.find_by(name: 'sleepytime')
		end

		@home = true

		# started trying to detect if coordinates are located
		if logged_in?
			if request.location.latitude != 0.0 && request.location.longitude != 0.0
				current_user.saveLat request.location.latitude
				current_user.saveLon request.location.longitude
			else
				# default to zip if no coords can be obtained
				current_user.saveLat current_user.zip.to_s.to_lat
				current_user.saveLon current_user.zip.to_s.to_lon 
			end
			if (current_user.zip.to_s.to_region(:city => true) != request.location.city) && request.location.city != ""
				@current_city = request.location.city
			else
				@current_city = current_user.zip.to_s.to_region(:city => true)
			end
		end
	end


	def show
		if logged_in?
			mood = Mood.find(params[:id])
			@discover = true
			# save each mood the user looks at to their account
			current_user.moods << mood
			current_user.save

			
			searchresults = mood.searchYelp(current_user).businesses
			# if at least one result
			if searchresults.length > 0
				# get top rated and most reviewed

				# results sorted increasing reviews
				sort_reviewed = searchresults.sort_by do |result| result.review_count end.reverse
				sort_rating = searchresults.sort_by do |result| result.rating end.reverse

				# initialize empty array to store dual sorted results in descending order
				top_list = []
				(sort_reviewed & sort_rating).each do |intersect| top_list << intersect end
				# random place from the top sorted list (top 10 or less)
				@mood = top_list.take(10).sample
			else
				@mood = false
			end

			@photo = mood.photo
			@name = mood.name
		else
			flash[:error] = "Please log in to view this page"
			redirect_to login_path
		end
	end

	def share
		require 'twilio-ruby'
		account_sid = 'AC9534c890191157016b5de8ae93b656d8'
		auth_token = 'd0a7fe1196c58e3fbb8b2844d74b5582'

		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new account_sid, auth_token
		share_url = "http://www.iffy.la/discover/#{params[:id]}"
		stuff = {
			:from => '+13237451232', :to => '+13474012203', :body => "http://Iffy.la says to go to #{params[:name]} at #{params[:address]} #{params[:url]}"
		}
		@client.messages.create(stuff) 
		flash[:error] = "Sent #{params[:name]} to #{stuff[:to]}"
		redirect_to discover_path(params[:id])
	end

	def directions
		redirect_to "http://maps.google.com/maps?q=#{params[:address]}"
	end

	def traveling
		current_user.setTravelingTrue
		redirect_to root_path
	end
end
