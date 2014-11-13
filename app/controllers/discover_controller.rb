class DiscoverController < ApplicationController

	def index
		@time = Time.now
		@pretty_time = Time.now.strftime('%l:%M%P')
		@hour = @time.hour
		@minute = @time.min
		@day = @time.strftime('%A')
		@abbr_day = @time.strftime('%a')
		@moods = Mood.all
		
		# always set variable as false
		@skip = false
		@city = request.location.city

		# if user selected from modal already then skip location modal, and reset as false
		if current_user
			if current_user.traveling == true
				@skip = true
				# reset after going back to home
				current_user.traveling = false
				current_user.save!
			else
				# when they haven't encountered modal
				@city = current_user.zip.to_s.to_region(city: true)	
			end
		end

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

		# always save request lat and long to user
		if logged_in? 
			current_user.latitude = request.location.latitude
			current_user.longitude = request.location.longitude	
			current_user.save
		end


		# figure out if it was from a new location then skip
	end


	def show
		if logged_in?
		@mood = Mood.find(params[:id])
		@discover = true
		# save each mood the user looks at to their account
		current_user.moods << @mood
		current_user.save
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
		current_user.traveling = true
		current_user.save
		redirect_to root_path
	end
end
