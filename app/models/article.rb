class Article < ApplicationRecord

  before_save :include_description2

  validates :title, presence: :true, length: { minimum: 3, maximum: 100}
  validates :description, presence: true, length: {maximum: 200}
  
  def include_description2
    self.description2 = self.description.capitalize  
  end

  def virtual_hash
    [ 
      "",
      [],
      nil,
      {},
      {"0": {}},
      {"0": {"99": "vazio"} },
      {"0": {"99": "10"}, "1": {"99": "20"}, "2": {"99": "40"} } 
    ].sample
  end

  def self.print_itens
    all.each do |article|
      itens = article.virtual_hash # gera uma vez, pois está aleatório
      if itens.present?
        itens.values.as_json.each do |item|
          puts "Id: #{article.id} - Title: #{article.title} - Item: #{item["99"]}"
        end
      else
        puts "Id: #{article.id} - Title: #{article.title} - Item: Nil ou '' ou {} }"
      end
    end
  end

end
