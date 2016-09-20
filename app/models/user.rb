class User < ActiveRecord::Base
  has_many :ferrets
  has_secure_password

end
