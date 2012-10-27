class MudarColunaDescricaoToCoisas < ActiveRecord::Migration
  def up
     change_column :coisas, :descricao, :text
 end
end
