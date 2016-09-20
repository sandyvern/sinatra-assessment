class CreateFerrets < ActiveRecord::Migration
  def change
    create_table :ferrets do |t|
        t.string :name
        t.integer :age
        t.string :color
        t.string :sex
        t.float :weight
        t.integer :user_id
    end
  end
end
