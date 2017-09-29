class User < ApplicationRecord
  has_many :favorites
  has_many :doctors, through: :favorites
  has_secure_password
end
