class CreateCoisas < ActiveRecord::Migration
  def change
    create_table :coisas do |t|
      t.string :nome
      t.string :descricao
      t.string :tags

      t.timestamps
    end
  end
end
