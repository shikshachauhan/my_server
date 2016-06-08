# require 'pact_helper.rb'
class SessionsController < ApplicationController #1
  before_filter :authenticate

  def delete
  	sign_out
  	redirect_to welcome_homepage_path
  end

  def profile

  end

  def account_settings

  end

end #1
