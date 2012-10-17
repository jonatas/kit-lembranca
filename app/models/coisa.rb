class Coisa < ActiveRecord::Base
  attr_accessible :descricao, :nome, :tags
  validates_uniqueness_of :nome
end
