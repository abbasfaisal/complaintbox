class User < ActiveRecord::Base
	validates :username, :presence => true, :uniqueness => true, :format => {:with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}
	validates :password, :presence => true, :length => {:within => 6..40}
end
