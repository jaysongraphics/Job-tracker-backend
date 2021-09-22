class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :status
      t.date :date
      t.text :notes

      t.timestamps
    end
  end
end
