class Article < ActiveRecord::Base

	belongs_to :author, :class_name => "Employee"
	
end
