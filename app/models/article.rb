# frozen_string_literal: true

class Article < ApplicationRecord
  # before_save :include_description2

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { maximum: 200 }

  def include_description2
    self.description2 = { '123' => { '0' => { '99' => '' } } }
    # self.description2 = {"123"=> {"0"=> {"99"=> "10"}, "1"=> {"99"=> "20"} } }
  end

  def virtual_hash2
    [
      '',
      [],
      nil,
      {},
      { "0": {} },
      { "0": { "99": 'vazio' } },
      { "0": { "99": '10' }, "1": { "99": '20' }, "2": { "99": '40' } }
    ].sample
  end

  def self.virtual_hash2
    { 'a' => '10', 'b' => '20' }
  end

  def self.print_itens
    all.each do |article|
      itens = article.virtual_hash # gera uma vez, pois está aleatório
      if itens.present?
        itens.values.as_json.each do |item|
          # puts "Id: #{article.id} - Title: #{article.title} - Item: #{item["99"]}"
          puts "Id: #{article.id} - Title: #{article.title} - Item: #{item.values[0] || 'Nada'}"
        end
      else
        puts "Id: #{article.id} - Title: #{article.title} - Item: Nil ou '' ou {} }"
      end
    end
  end

  # lista filtrada qualquer = lista
  # lista clonada por itens = lista.por_itens
  def self.por_itens
    b = []
    all.select(:id).select('description2').each do |a|
      if a.description2.present? && a.description2.match(/=>/)
        # valores = JSON.parse(a.description2.gsub("=>", ":"))
        # valores.values.first.values.each do |i|
        eval(a.description2).values.first.each_value do |i|
          c = Marshal.load(Marshal.dump(a))
          c.description2 = i['99']
          b << c
        end
      else
        b << a
      end
    end
    b
  end

  def self.por_itens2
    datas = all.select(:id).select('description2')
    datas.each do |resource|
      if resource.description2.present? && resource.description2.match(/=>/)
        eval(resource.description2)['123'].each_value do |i|
          p "#{resource.id} - #{i['99']}"
        end
      else
        p "#{resource.id} - #{resource.description2}"
      end
    end
  end
end
