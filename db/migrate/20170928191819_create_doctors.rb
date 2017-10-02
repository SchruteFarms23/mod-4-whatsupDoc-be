class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialties
      t.array :insurance
      t.string :city
      t.string :state
      t.string :zip
      t.string :image_url
      t.string :bio


      t.timestamps
    end
  end
end
