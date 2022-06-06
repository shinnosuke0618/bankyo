class ApplicationController < ActionController::Base

 #sessionヘルパーモジュールを全てのページで使えるようにする
 include Public::SessionsHelper
end
