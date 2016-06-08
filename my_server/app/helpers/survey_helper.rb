require 'set'
module SurveyHelper #1
	def CheckParams_Gcm_CallerIds_Name(gcmid, caller_ids, name) #2
	    if !gcmid.present? or !caller_ids.present? or !name.present? #9 Either of the three not present
	      if gcmid.present? #10
	        if caller_ids.present? #11
	         if !name.present? #12
	          puts 'Schedule name not present! Failure!'
	          return "Schedule name not present! Failure!+400"
	         end #12
	        else #11
	         puts 'Phone numbers not present! Failure!'
	         return "Phone numbers not present! Failure!+400"
	        end #11
	      else #10
	        puts 'GCM ID not present! Failure!'
	        return "GCM ID not present! Failure!+401"
	      end #10
	    else #9
	      puts "All 3 parameters present : Schedule name, Phones, gcmid"
	      return "All 3 parameters present : Schedule name, Phones, gcmid+200"
	    end #9
	end #2
end #1
