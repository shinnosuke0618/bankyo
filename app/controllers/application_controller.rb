class ApplicationController < ActionController::Base

 #sessionヘルパーモジュールを全てのページで使えるようにする
 include Public::SessionsHelper
 
 private
   # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
    
end
