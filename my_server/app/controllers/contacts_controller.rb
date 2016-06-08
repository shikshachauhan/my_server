class ContactsController < ApplicationController #1
	def getcontact #2
		gcmid = params[:gcmid]
		admin = Admin.where(gcmid: gcmid).first  #Find the admin who has launched the message
	    if admin #8
	    	puts "inadmin"
	    	search_names = "" 
			search_callers = ""
			search_names =  params[:search_names]
	    	search_callers =  params[:search_callers]
	    	contact_list = params[:contact_list]  #neccessary parameter
	    	puts search_names
	    	puts search_callers
	    	puts contact_list
	    	begin
  				response = RestClient::Request.execute(method: :get , url: "#{@gv_ip}/vapp/api/v1/callerinfo_contact/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json", contact_list: contact_list, search_names: search_names, search_callers: search_callers, timeout: @timeout)
			rescue => e
  				e.inspect
			end
			if response == nil #9
				render json: { message: 'Could not get contacts!'}, status: 403
			else #9
				response = JSON.parse(response.body)
				if response['objects'] #10
	     			render json: { message: response }, status: 200  
		   		else #10
	   				render json: { message: 'Could not get contacts!'}, status: 403
	   			end #10
	   		end #9
	    else #8
	    	puts "outadmin"
	    	render json: { message: 'Not an Authorized Admin!' }, status: 401
	     	#message = "Not an Authorized Admin!"
	    	#push_gcm(gcmid,message)
	    end #8		
	end #2

	def getcontactlist #2
		gcmid = params[:gcmid]
		admin = Admin.where(gcmid: gcmid).first  #Find the admin who has launched the message
		if admin #8
			puts "inadmin"
			begin
  				response = RestClient::Request.execute(method: :get, url: "#{@gv_ip}/vapp/api/v1/callerinfo_contact_list/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json", timeout: @timeout)
			rescue => e
  				e.inspect
			end
			if response == nil #9
				render json: { message: 'Could not get contactlist!'}, status: 403
			else #9
				response = JSON.parse(response.body)
				if response['objects'] #10 
     				render json: { message: response }, status: 200  
	   			else #10
   					render json: { message: 'Could not get contactlist!'}, status: 403
   				end #10
   			end #9
    	else #8
    		puts "outadmin"
     		render json: { message: 'Not an Authorized Admin!' }, status: 401
     		#message = "Not an Authorized Admin!"
     		#push_gcm(gcmid,message)  
    	end #8		
	end #2

	def postcontact #1
		gcmid = params[:gcmid]
      	
		if !gcmid.present? #2
			render json: { message: 'GCM ID not present! Failure!'}, status: 403
		else #2
			if !params[:name].present? or !params[:clist_ids].present? or !params[:number].present? or !params[:gender].present? or !params[:resource_uri].present? #3
				render json: { message: 'All the parameters not present! Failure!'}, status: 403
			else #3

				name = params[:name] 
				number = params[:number].to_s
				gender = params[:gender]
				location_fk = params[:resource_uri]
				clist_ids = params[:clist_ids]
				age = params[:age]
				city = params[:city]
				city = ""
				state = params[:state]
				district = params[:district]
				block = params[:block]
				location = params[:location]
				puts name
				puts number
				puts gender
				puts age
				puts location_fk
				puts clist_ids
				puts city
				puts state
				puts district
				puts block
				admin = Admin.where(gcmid: gcmid).first  #Find the admin who has launched the message
				if admin #8
					puts "inadmin"
					#render json: { message: 'Contact Created!' }, status: 200  

					http = Net::HTTP.new('internal.gramvaani.org', 8081, :read_timeout => @timeout)
					http.read_timeout = @timeout
					req = Net::HTTP::Post.new('/vapp/api/v1/callerinfo_contact/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json',initheader = {'Content-Type' =>'application/json'})
					#data = {"name": params[:name].to_s, "clist_ids": params[:clist_ids].to_s, "number": params[:number].to_s, "gender": params[:gender].to_s}
					data = {:name=> params[:name].to_s, :clist_ids=> params[:clist_ids].to_s, :number=> params[:number].to_s, :gender=> params[:gender].to_s, :location_fk=> params[:resource_uri].to_s} 
					puts data
					req.body = data.to_json

					begin
  						response = http.request(req)
					rescue StandardError => error
  						puts error.inspect
					end
					
					puts response.code.to_i
					puts response.class.name
					if response.class.name == "Net::HTTPCreated" and response.code.to_i == 201 #7
						puts "contact created"
						#create user in local Database
						@user = User.create(name: name, contact: number, gender: gender, age: age, city: city, state: state, district: district, block: block, location: location created_at: Time.now.inspect, updated_at: Time.now.inspect)            
			     		puts "contact created in local Database"
			     		@task = Task.create(ItemId: @user.id, TaskName: 'CreateContact', Status: 'Completed', MemberId: admin.id, Type: 'Contact', Contacts: number, Groups: "", created_at: Time.now.inspect, updated_at: Time.now.inspect) 
	    	     		render json: { message: 'New Contact Created!' }, status: 200
	    	     		message = "New contact created"
	    	     		code = 6
		     			push_gcm(gcmid,message,code)

				   	else #7
				   		@task = Task.create(ItemId: 0, TaskName: 'CreateContact', Status: 'Rejected', MemberId: admin.id, Type: 'Contact', Contacts: number, Groups: "", created_at: Time.now.inspect, updated_at: Time.now.inspect) 
			   			render json: { message: 'Could not create contact!'}, status: 403
			   		end #7

		    	else #8
		    		puts "outadmin"
		     		render json: { message: 'Not an Authorized Admin!' }, status: 401
		     		#message = "Not an Authorized Admin!"
		     		#push_gcm(gcmid,message)  

		    	end #8
		    end #3
		end #2		
	end #1

	def postcontactlist #2
		gcmid = params[:gcmid]
		admin = Admin.where(gcmid: gcmid).first  #Find the admin who has launched the message
		if admin #8
			puts "inadmin"
			data = {:name=> params[:name].to_s}
			puts data
			http = Net::HTTP.new('internal.gramvaani.org', 8081, :read_timeout => @timeout)
			http.read_timeout = @timeout
			req = Net::HTTP::Post.new('/vapp/api/v1/callerinfo_contact_list/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json',initheader = {'Content-Type' =>'application/json'})
			req.body = data.to_json

			begin
  				response = http.request(req)
			rescue StandardError => error
  				puts error.inspect
			end
					
			puts response.code.to_i
			puts response.class.name

	   		if response.class.name == "Net::HTTPCreated" and response.code.to_i == 201 #7
				puts "contactlist created"
				#create user in local Database
				#@group = Group.create(Name: params[:name].to_s, MemberId: admin.id, Status: "Completed", created_at: Time.now.inspect, updated_at: Time.now.inspect)            
			    #puts "contactlist created in local Database"
			    #@task = Task.create(ItemId: @group.id, TaskName: 'CreateContactList', Status: 'Completed', MemberId: admin.id, Type: 'ContactList', Contacts: "", Groups: "", created_at: Time.now.inspect, updated_at: Time.now.inspect) 
	    	    @task = Task.create(ItemId: 100, TaskName: 'CreateContactList', Status: 'Completed', MemberId: admin.id, Type: 'ContactList', Contacts: "", Groups: params[:name].to_s, created_at: Time.now.inspect, updated_at: Time.now.inspect)
	    	    puts "contactlist created in local Database"
	    	    render json: { message: 'Contact List Created!' }, status: 200
	    	    message = "New contact group created"
	    	    code = 5
		     	push_gcm(gcmid,message,code)
			
			else #7
				@task = Task.create(ItemId: 100, TaskName: 'CreateContactList', Status: 'Rejected', MemberId: admin.id, Type: 'ContactList', Contacts: "", Groups: params[:name].to_s, created_at: Time.now.inspect, updated_at: Time.now.inspect) 
			   	render json: { message: 'Could not create contactlist!'}, status: 403
			end #7
    	else #8
    		puts "outadmin"
     		render json: { message: 'Not an Authorized Admin!' }, status: 401
     		#message = "Not an Authorized Admin!"
     		#push_gcm(gcmid,message)  
    	end #8		
	end #2
end #1


  
