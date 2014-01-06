class Comment < ActiveRecord::Base
	belongs_to :book
	has_ancestry

	validates :email, :name, :content, presence: true
	validates :name, :content, length: { minimum: 2 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
