class AddPlacesTable < ActiveRecord::Migration[7.0]
      # create_table :places, id: :uuid, default: -> { "uuid_generate_v4()" } do |t|
  def change
    create_table :places do |t|
      t.string :name, null:false
      t.string :address, null:false
      t.string :city, null:false

      t.timestamps
    end 
  end
end
