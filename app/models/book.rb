class Book < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	
	validates :title, :description, :author, presence: true
	validates :title, :author, length: { minimum: 3, maximum: 150 }
	validates :description, length: { minimum: 3 }

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	def self.search(search)
		if search
			find(:all, :conditions => ['title LIKE :search OR author LIKE :search OR description LIKE :search', { :search => "%#{search}"}])
		else
			find(:all)
		end
	end
end
