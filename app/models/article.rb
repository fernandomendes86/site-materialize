class Article < ApplicationRecord

  before_save :include_description2

  validates :title, :description, presence: :true

  def include_description2
    self.description2 = self.description.capitalize  
  end

end
