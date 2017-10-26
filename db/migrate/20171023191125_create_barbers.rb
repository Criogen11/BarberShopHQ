class CreateBarbers < ActiveRecord::Migration[5.1]
  def change
  	create_table :barbers do |t|
  		t.text :name

  		t.timestamps
  	end
  	
Barber.create :name => 'Илья Варсин'
Barber.create :name => 'Ирина Ильина'
Barber.create :name => 'Катерина Зорина'

  end
end
