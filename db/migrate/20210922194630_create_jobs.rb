class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.text :description
      t.float :salary
      t.text :requirements
      t.string :contact
      t.string :link

      t.timestamps
    end
  end
end
