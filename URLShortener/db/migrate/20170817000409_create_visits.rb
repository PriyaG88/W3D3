class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :visitor_id, null: false
      t.string :visited_url, null: false
      t.timestamps
    end
    add_index :visits, :visitor_id, unique: true
  end
end
