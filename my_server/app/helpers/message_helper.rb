module MessageHelper #1
  def CheckParams_Gcm_Message(gcmid, caller_ids, message_id, message_args) #2
    if !gcmid.present? or !caller_ids.present? or !message_id.present? or !message_args.present? #9 Either of the four not present
      if gcmid.present? #10
        if caller_ids.present? #11
          if message_id.present? #12
            if !message_args.present? #13
              puts 'Message Args not present! Failure!'
              return "Message Args not present! Failure!+400"
            end
          else #12
            puts 'Message ID not present! Failure!'
            return "Message ID not present! Failure!+400"
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
      puts "All 4 parameters present : Phone numbers, Message ID, Message Args, gcmid"
      return "All 4 parameters present : Phone numbers, Message ID, Message Args, gcmid+200"
    end #9
  end #2
end #1
