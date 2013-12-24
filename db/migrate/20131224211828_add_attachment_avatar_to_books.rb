class AddAttachmentAvatarToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :books, :avatar
  end
end
