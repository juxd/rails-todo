class User < ApplicationRecord
  has_many :items
  has_many :tags
  has_secure_password
  
end

