class CreateYotta < ActiveRecord::Migration
  def change
    create_table :yotta do |t|
      t.references :drive, index: true, foreign_key: true
      t.references :run_information, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
