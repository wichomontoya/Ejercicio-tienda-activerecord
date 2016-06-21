class CreateItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.string :nombre
  		t.integer :precio
    	t.belongs_to :usuario
  	end
  end
end
