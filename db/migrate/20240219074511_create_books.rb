class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :body
      t.string :name
      t.string :image
      t.string :opinion

      t.timestamps
    end
  end
end
