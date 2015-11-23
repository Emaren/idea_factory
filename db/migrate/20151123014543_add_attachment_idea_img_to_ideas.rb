class AddAttachmentIdeaImgToIdeas < ActiveRecord::Migration
  def self.up
    change_table :ideas do |t|
      t.attachment :idea_img
    end
  end

  def self.down
    remove_attachment :ideas, :idea_img
  end
end
