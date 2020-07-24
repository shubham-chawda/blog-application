class Rating < ApplicationRecord

  belongs_to :post
  belongs_to :user
  validates_inclusion_of :star, :in => 1..5
end
