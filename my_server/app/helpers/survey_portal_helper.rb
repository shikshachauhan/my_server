module SurveyPortalHelper

  def Location_Admin(location) #3
    admin_set = Set.new
    @users = User.where(location: location)
    @users.each do |u|  #4
      puts u.name
      admin = Admin.where(user_id: u.id).first
      admin_set.add(admin)
    end #4
    return admin_set
  end #3
end
