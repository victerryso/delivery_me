class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :password_digest
      t.string  :name, :default => 'Someone'
      t.text    :image, :default => 'http://www.fedical.com/wp-content/uploads/2014/04/Happy-face-coloring-pages.jpg'
      t.integer :credibility, :default => 0
      t.string  :city
      t.string  :state
      t.string  :country
      t.float   :latitude
      t.float   :longitude
      t.timestamps
    end
  end
end
