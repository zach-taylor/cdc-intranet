class Employee < ActiveRecord::Base
	has_many :passwords
	has_many :articles

	def self.authenticate(name, password)
    user = self.find(:first, "username = '#{name}' AND password = '#{password}'")
  end
  
  ROLES = ['admin','hr','employee','blogger']
  
end
