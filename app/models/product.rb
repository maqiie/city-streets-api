class Product < ApplicationRecord
    has_many :cart_items
    belongs_to :brand


    enum gender: { men: 'Men', women: 'Women' }
  enum style: { casual: 'Casual', official: 'Official' }
end
