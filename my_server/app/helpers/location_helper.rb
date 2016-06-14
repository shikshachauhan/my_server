module LocationHelper
 	def getlocation #1.1
			response = ""
	    begin
	      response = RestClient::Request.execute(method: :get , url: "#{@gv_ip}/vapp/api/v1/location_location/?api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json",timeout: @timeout)
	    rescue => e
	      e.inspect
	    end
			if e.present? #9 If error caught

				case e.message
					when "Request Timeout" #10
						puts "#{e.message} 408"
						#render json: { message: e.message }, status: 408
					else #10
						puts "#{e.message} #{e.message[0..2].to_i}"
						#render json: { message: e.message }, status: e.message[0..2].to_i
				end #10
				return response
			else #9 If NO error caught
				response = JSON.parse(response.body)
		    if response['objects'] #3
		        puts "Got all Locations!"
						response['objects'].each do |sur| #4
							#Rails.logger.info sur['id']
							p sur['desc']
						end#4
		    else #3
		        puts "Could not get locations!"
		    end #3
	    end #9
	    return response
  end #1.1
end
