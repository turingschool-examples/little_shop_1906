class Item <ApplicationRecord
  belongs_to :merchant
  has_many :reviews, dependent: :destroy

  validates_presence_of :name,
                        :description,
                        :price,
                        :image,
                        :inventory
  validates_inclusion_of :active?, :in => [true, false]

end
