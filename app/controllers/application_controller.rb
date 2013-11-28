class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  if ENV.has_key?('CSRF')
    if ENV['CSRF'].downcase == 'no'
      skip_before_action :verify_authenticity_token
    end
  end

end
