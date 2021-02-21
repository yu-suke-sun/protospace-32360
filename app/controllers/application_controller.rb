class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position] )
  end
end

# application_controllerにbefore_actionを使用しているため、
# 全てのアクションが実行される前に、 
# before_action :configure_permitted_parameters, if: :devise_controller?
# が実行されることになります。
# deviseのコントローラーから呼び出された場合は、
# configure_permitted_parametersメソッドが呼ばれます。

# deviseをインストールすることでdevise_parameter_sanitizerメソッドが使えるようになります。
# deviseでユーザー登録をする場合に使用でき、「特定のカラムを許容する」メソッドです
