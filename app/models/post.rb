class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 10}
	validate :invalid_category

	def invalid_category
		values = ["Fiction", "Non-Fiction"]
		result = false
		values.each do |value|
			if value == self.category 
				result = true
			end
		end
		if result == false
			errors.add(:category, "No valid category name")
		end
		result
	end
end
