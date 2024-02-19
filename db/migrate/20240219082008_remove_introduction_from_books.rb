class RemoveIntroductionFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :Introduction, :text
  end
end
