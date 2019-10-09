class Item < ApplicationRecord
  belongs_to :merchant
  has_many :reviews

  validates_presence_of :name,
                        :description,
                        :price,
                        :image,
                        :inventory
  validates_inclusion_of :active?, in: [true, false]

  validates_numericality_of :price
  validates_numericality_of :price, greater_than: 0
  validates_numericality_of :inventory, only_integer: true
  validates_numericality_of :inventory, greater_than: 0

end
