class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.integer :person_id
      t.integer :business_id

      t.timestamps
    end
  end
end