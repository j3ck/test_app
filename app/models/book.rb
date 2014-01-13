class Book < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_attached_file :avatar, :styles => { :small => "70x96>", :large => "200x306>" }, :default_url => "/images/:style/missing.png"
	
	validates :title, :description, :author, presence: true
	validates :title, :author, length: { minimum: 3, maximum: 150 }
	validates :description, length: { minimum: 3 }
	validates_attachment_size :avatar, :less_than => 1.megabytes

	include Tire::Model::Search
 	include Tire::Model::Callbacks

=begin
	def self.search(params)
		if search
			find(:all, :conditions => ['title LIKE :search OR author LIKE :search OR description LIKE :search', { :search => "%#{search}"}])
		else
			find(:all)
		end
	end
=end
	def self.search(params)
		tire.search(load: true) do
			query { string params, default_operator: "AND" }
		end
	end
end
