class AddAttachmentAttachedToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :attached
    end
  end

  def self.down
    remove_attachment :uploads, :attached
  end
end
