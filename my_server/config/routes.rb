Rails.application.routes.draw do

  

  




  # get 'registeradmins/index'

  # get 'registeradmins/show'

  # get 'registeradmins/new'

  # get 'registeradmins/edit'

  # get 'registeradmins/create'

  # get 'registeradmins/update'

  # get 'registeradmins/destroy'

  #get 'users/createadmin'



  root 'welcome#homepage'
  post '/login', to: 'admins#login'
  post '/logout', to: 'admins#logout'
  post '/user', to: 'users#create'
  get '/users', to: 'users#index'
  post '/recording', to: 'recordings#upload'
  post '/message', to: 'message#upload'
  get '/contact', to: 'contacts#getcontact'
  get '/contactlist', to: 'contacts#getcontactlist'
  post '/contact', to: 'contacts#postcontact'
  post '/contactlist', to: 'contacts#postcontactlist'
  post '/getpin', to: 'admins#getpin'
  post '/launchsurvey', to: 'survey#launch'
  get '/getsurveys', to: 'survey#listsurvey_app'
  get '/createsurvey', to: 'survey#createsurvey'
  get '/getlocations', to: 'location#getlocation'
  get '/getquestions', to: 'survey#getsurveyquestion_app'
  get '/getsurveyresponses', to: 'survey#getsurveyresponse_app'
  get '/getgrouplist', to: 'survey#group2con'
  get '/get_MVcallers', to: 'survey#MVcallers_1'
  post '/push_gcm', to: 'application#push_gcm_1'
  get '/getadmininfo', to: 'admins#GetAdminInfo'
  get '/getadminlocation', to: 'registeradmins#getlocations'

  #*************** WELCOME CONTROLLER ******************
  get 'welcome/homepage'
  get 'welcome/contact'

  #*************** SURVEY CONTROLLER ******************


  get 'survey/repo'
  post 'survey/questionattr'

  #*************** SESSIONS CONTROLLER ******************

  delete  'sessions/delete' #delete
  get  'sessions/account_settings' #account_settings
  get  'sessions/profile' #profile


  #*************** NGO USERS CONTROLLER ******************
  post 'ngo_users/create'     #create
  get  'ngo_users/new' #new
  get  'ngo_users/show' #show

  #*************** REGISTERADMINS CONTROLLER ******************
  resources :registeradmins

  #*************** SURVEY PORTAL CONTROLLER ******************
  get 'survey_portal/listsurvey'

  get 'survey_portal/create'

  post 'survey_portal/create'

  post 'survey_portal/SelectAdmintoLaunchSurvey'

  post 'survey_portal/complete'

  get 'survey_portal/survey_response'

  get 'survey_portal/survey_question'

  get 'location/getlocation'

  #*************** LOGIN PORTAL CONTROLLER ******************

  get 'login_portal/new'

  post 'login_portal/create'

  get 'login_portal/invalid'

end
