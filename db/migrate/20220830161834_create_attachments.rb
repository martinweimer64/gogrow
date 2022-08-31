class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.text :base_64_file
      t.timestamps
    end
  end
end

