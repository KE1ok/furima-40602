class CreateAreaData < ActiveRecord::Migration[7.0]
  def change
    create_table :area_data do |t|
      t.string      :postal_code,    null: false
      t.integer     :prefecture_id,  null: false
      t.string      :municipalities, null: false
      t.string      :street,         null: false
      t.string      :building_name
      t.string      :telephone,      null: false
      t.references  :purchase,       null: false, foreign_key: true
      t.timestamps  
    end
  end
end
