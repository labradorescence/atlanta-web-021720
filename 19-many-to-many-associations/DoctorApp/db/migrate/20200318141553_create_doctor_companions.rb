class CreateDoctorCompanions < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_companions do |t|
      t.integer :doctor_id
      t.integer :companion_id
      t.timestamps
    end
  end
end
