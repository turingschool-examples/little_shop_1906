class Review < ApplicationRecord
  belongs_to :item

  validates_presence_of :title,
                        :content
  validates :rating, numericality: {only_integer: true,
                                    greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 5}
end
