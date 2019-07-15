class User < ActiveRecord::Base


  has_many :reviews
  has_secure_password

  validates :email, 
              presence: true,
              uniqueness: true,
              format: {
                with: /([^@\s]+@((?:[a-z0-9]+\.)+[a-z]{2,}))/i
              }
  validates :password, 
            presence: true

  validates :first_name,
              presence: true

  validates :last_name, 
              presence: true



  
end
