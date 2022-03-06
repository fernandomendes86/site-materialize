class Article < ApplicationRecord

  before_save :include_description2

  validates :title, presence: :true, length: { minimum: 3, maximum: 100}
  validates :description, presence: true, length: {maximum: 200}
  
  def include_description2
    self.description2 = self.description.capitalize  
  end

end
