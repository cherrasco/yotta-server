class CreateRunInformations < ActiveRecord::Migration
  def change
    create_table :run_informations do |t|
      t.integer :drive_id
      t.float :vehicle_speed
      t.float :engine_speed
      t.decimal :acceleration_x, precision: 11, scale: 8
      t.decimal :acceleration_y, precision: 11, scale: 8
      t.decimal :acceleration_z, precision: 11, scale: 8
      t.decimal :gyro_x, precision: 11, scale: 8
      t.decimal :gyro_y, precision: 11, scale: 8
      t.decimal :gyro_z, precision: 11, scale: 8
      t.float :steering_wheel
      t.decimal :latitude, precision: 11, scale: 8
      t.decimal :longitude, precision: 11, scale: 8
      t.decimal :altitude, precision: 11, scale: 8
      t.float :gps_heading
      t.float :gps_speed

      t.timestamps null: false
    end

    add_index :run_informations, :drive_id
  end
end
