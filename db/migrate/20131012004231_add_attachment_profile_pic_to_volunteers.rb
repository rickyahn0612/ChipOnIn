class AddAttachmentProfilePicToVolunteers < ActiveRecord::Migration
  def self.up
    change_table :volunteers do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    drop_attached_file :volunteers, :profile_pic
  end
end
