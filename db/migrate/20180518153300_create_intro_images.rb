class CreateIntroImages < ActiveRecord::Migration[5.1]
  def change
    create_table :intro_images do |t|
      t.attachment :image

      t.timestamps
    end
  end
end
