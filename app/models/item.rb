class Item <ApplicationRecord
  belongs_to :merchant
  has_many :reviews

  validates_presence_of :name,
                        :description,
                        :price,
                        :image,
                        :inventory
  validates_inclusion_of :active?, :in => [true, false]

  def top_three_reviews
    self.reviews.order("rating desc").limit(3)
  end

  def bottom_three_reviews
    self.reviews.order(:rating).limit(3)
  end

  def average_rating
    self.reviews.average(:rating).to_f.round(2)
  end
end
