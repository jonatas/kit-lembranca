class Coisa < ActiveRecord::Base
  attr_accessible :descricao, :nome, :tags
  validates_uniqueness_of :nome
  scope :de_hoje, lambda { where "created_at > ?", Time.now.at_beginning_of_day }
  scope :esta_semana, lambda { where "created_at > ?", Time.now.at_beginning_of_week }
  scope :este_mes, lambda { where "created_at > ?", Time.now.at_beginning_of_month }

  def self.by_tags
    tags = {}
    all.each do |coisa|
      coisa.tags.split(/\s*,\s*/).each do |tag|
        tag.capitalize!
        tags[tag]||= []
        tags[tag] << coisa
      end
    end
    tags
  end
end
