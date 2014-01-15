require "open-uri"
class Book < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_attached_file :avatar, :styles => { :small => "70x96>", :large => "200x306>" }, :default_url => "/missing.jpg"
	
	validates :title, :description, :author, presence: true
	validates :title, :author, length: { minimum: 3, maximum: 150 }
	validates :description, length: { minimum: 3 }
	validates_attachment_size :avatar, :less_than => 1.megabytes
  
	include Tire::Model::Search
 	include Tire::Model::Callbacks

	def self.search(params)
		tire.search :page => params[:page], :per_page => 10, load: true do
			query { string params[:query], default_operator: "AND" }
		end
	end
end
