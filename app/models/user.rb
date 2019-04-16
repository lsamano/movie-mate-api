class User < ApplicationRecord
  has_secure_password
  include Gravtastic
  gravtastic
  validates :username, uniqueness: { case_sensitive: false }
end
