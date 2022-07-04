class Admin < ApplicationRecord
   
  #パスワードのメソッド
  has_secure_password validations: true
end
