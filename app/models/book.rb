class Book < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_attached_file :avatar, :styles => { :small => "70x96>", :large => "200x306>" }, :default_url => "/images/:style/missing.png"
	
	validates :title, :description, :author, presence: true
	validates :title, :author, length: { minimum: 3, maximum: 150 }
	validates :description, length: { minimum: 3 }
	validates_attachment_size :avatar, :less_than => 1.megabytes

	def self.search(search)
		if search
			find(:all, :conditions => ['title LIKE :search OR author LIKE :search OR description LIKE :search', { :search => "%#{search}"}])
		else
			find(:all)
		end
	end
end
