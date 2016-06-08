class AddAttachmentImageToShoes < ActiveRecord::Migration
  def self.up
    add_attachment :shoes, :image
  end

  def self.down
    remove_attachment :shoes, :image
  end
end
