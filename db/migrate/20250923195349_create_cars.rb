class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :car_model
      t.string :version
      t.integer :year
      t.integer :miles
      t.string :color
      t.integer :doors
      t.text :description
      t.string :fuel_type
      t.string :transmission
      t.string :body_type
      t.integer :displacement
      t.integer :horse_power
      t.integer :torque
      t.float :acceleration
      t.integer :autonomy
      t.integer :airbags
      t.boolean :ABS
      t.boolean :traction_control
      t.integer :capacity
      t.integer :tank_capacity
      t.float :consumption
      t.boolean :leather_seats
      t.text :services
      t.text :occur_accident
      t.string :serial_number

      t.timestamps
    end
  end
end
