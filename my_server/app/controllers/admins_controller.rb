class AdminsController < ApplicationController   #1
  def login #2
    
    puts "gcmid "+params[:gcmid].to_s
    if params[:gcmid].present? #2.1
      puts "phone "+params[:phone].to_s
      if params[:phone].present? and params[:pin].present?  #2.2
        puts "pin "+params[:pin].to_s
        user =  User.where(contact: params[:phone]).first
        puts user
        puts "1"
        if user  #3
          puts "User found!"
          admin = Admin.where(user_id: user.id).first
          puts "2"
          puts admin
          if admin #4 if the admin exists with the given phone number
            puts "Admin found!"
            if admin.pin.to_s == params[:pin] #5 if the pin matches with the registered pin
              puts "Pin matched! Login"
              admin.update(logged_in: 1)
              admin.update(gcmid: params[:gcmid])
              render json: { message: 'Successfully logged in', authenticity_token: params[:gcmid] }, status: 200
            else #5 if the pin does not match with the registered pin
              puts "Pin did not match! Invalid Credentials"
              render json: { message: 'Invalid Credentials. Pin did not match! Forgot Pin?'}, status: 404
            end #5
          else #4 if the admin does not exist with the given phone number
            puts 'No admin registered with the given phone number!'
            render json: { message: 'No admin registered with the given phone number!' }, status: 403
          end #4
        else #3
          puts 'No user registered with the given phone number!'
          render json: { message: 'No user registered with the given phone number!' }, status: 403
        end #3
      else #2.2
        puts 'Either phone number or pin number not present. Failure!'
        render json: { message: 'Either phone number or pin number not present. Failure!' }, status: 403
      end #2.2
    else #2.1
      puts 'GCM ID not present. Failure!'
      render json: { message: 'GCM ID not present. Failure!' }, status: 403
    end #2.1
  end  #2
    # if admin
    #   digest = Digest::SHA1.hexdigest([Time.current, (1..10).map{ rand.to_s }].flatten.join('--')).first(40)
    #   admin.update(logged_in: digest)
    #   render json: { message: 'Successfully logged in', authenticity_token: params[:gcmid] }, status: 200
    # else
    #   render json: { message: 'invalid credentails' }, status: 403
    # end
  

  def logout #2
    if current_user #3
      current_user.update(logged_in: 0)
    end #3
    render json: { message: 'Successfully logged out' }, status: 200
  end #2


  def getpin #2
     user =  User.where(contact: params[:phone]).first
      if user #3
        puts "User found!"
        admin = Admin.where(user_id: user.id).first
        puts admin
        if admin #4 if the admin exists with the given phone number
          phone = params[:phone]
          render json: { message: "Pin number is sent on the given phone number." }, status: 200
          message = "Recovery pin to login on GramVaani Soochna Sanchar is #{admin.pin}."
          response = Unirest.get("https://webaroo-send-message-v1.p.mashape.com/sendMessage?message=#{message}&phone=#{phone}",headers:{"X-Mashape-Key" => "f06AZcQGeAmshIDGUUTrEys1oikdp1J69xSjsn08nRoXRaVURu"})
        
        else #4 if the admin does not exist with the given phone number
          puts 'No admin registered with the given phone number!'
          render json: { message: 'No admin registered with the given phone number!' }, status: 403
        end #4
      else #3
        puts 'No user registered with the given phone number!'
        render json: { message: 'No user registered with the given phone number!' }, status: 403
      end #3
  end #2

  def GetAdminInfo #2
    if !params[:gcmid].present? #3
      puts "Unauthorized! GCMID not present"
      render json: { message: "Unauthorized! GCMID not present" }, status: 401
      return
    else #3
      admin = Admin.where(gcmid: params[:gcmid]).first
      if !admin.present? #4
        puts "Unauthorized! No admin registered with the given GCMID."
        render json: { message: "Unauthorized! No admin registered with the given GCMID." }, status: 401
        #message = "No admin registered with the given GCMID."
        #push_gcm(params[:gcmid],message)
        return
      else #4
        user = User.where(id: admin.id).first
        puts "pin: #{admin.pin}, gcmid: #{admin.gcmid}, name: #{user.name}, contact: #{user.contact}, gender: #{user.gender}, age: #{user.age}, city: #{user.city}, state: #{user.state}, block: #{user.block}, district: #{user.district} "
        render json: { pin: admin.pin, gcmid: admin.gcmid, name: user.name, contact: user.contact, gender: user.gender, age: user.age, city: user.city, state: user.state, block: user.block, district: user.district , location: user.location}, status: 200
        #message = "Admin Information received Successfully"
        #push_gcm(params[:gcmid],message)
      end #4
    end #3
  end #2
end #1
