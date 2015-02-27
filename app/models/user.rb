class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :authentications

  extend Enumerize
  enumerize :role, in: [ :user, :admin ], default: :user
end
