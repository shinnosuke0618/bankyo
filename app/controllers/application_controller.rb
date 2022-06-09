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

   def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "ゲストユーザー"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
   end

end
