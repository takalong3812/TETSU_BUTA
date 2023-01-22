class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      
      t.string :address, null:false
      t.float :latitude, null:false
      t.float :longitude, null:false
      t.references :review_id, foreign_key: true, null:false

      t.timestamps
    end
  end
end
