class ApplicationController < ActionController::Base
    #deviseの機能が使われるアクションが実行される時に、その前にconfigure_permitted_parametersを実行
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
    
    def configure_permitted_parameters
      #nameカラムを追加したため
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
  end