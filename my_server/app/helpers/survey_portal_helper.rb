module SurveyPortalHelper
# Adding those users from the users table to the set which are admins
  def Location_Admin(location) #3
    admin_set = Set.new
    @users = User.where(location: location)
    @users.each do |u|  #4
      puts u.name
      admin = Admin.where(user_id: u.id).first
      if admin.present?
        admin_set.add(u)
      end
    end #4
    return admin_set
  end #3

  def getsurvey(ai_id) #10
    #Fetch all the surveys
    puts "Fetch all the surveys"
    response = ""
    begin
      response = RestClient::Request.execute(method: :get , url: "#{@gv_ip}/vapp/api/v1/survey_survey/?ai_id=#{ai_id}&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json",timeout: @timeout)
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
      if response['objects'] #11
        puts "Got all surveys!"
        response['objects'].each do |sur| #4
          #Rails.logger.info sur['id']
          p sur['id']
        end#4
      else #11
        puts "Could not get surveys!"
      end #11
    end #9
    return response
  end #10

  def getsurvey_question(form_id) #12
    #Fetch all the questions
    puts "*******************************Fetch all the questions of form #{form_id}*************************************************"
    response = ""
    begin
      response = RestClient::Request.execute(method: :get , url: "#{@gv_ip}/vapp/api/v1/form_question/?form_id=#{form_id}&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json",timeout: @timeout)
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
      if response['objects'] #11
        puts "Got all questions!"
      else #11
        puts "Could not get questions!"
      end #11
    end #9
    return response
  end #12


  def getsurvey_response(survey_id, ai_id) #13
    #Fetch all the response
    puts "*******************************Fetch all the responses of survey #{survey_id}*************************************************"
    response = ""
    begin
      response = RestClient::Request.execute(method: :get , url: "#{@gv_ip}/vapp/api/v1/survey_record/cdr_records/?ai_id=#{ai_id}&survey_id=#{survey_id}&limit=20&page=1&api_key=38dc9ea2dc8878b8ac674b3baef02d1973de5362&username=preeti&format=json",timeout: @timeout)
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
      if response['data'] #11
        puts "Got all responses!"
      else #11
        puts "Could not get responses!"
      end #11
    end #9
    return response
  end #13

end


