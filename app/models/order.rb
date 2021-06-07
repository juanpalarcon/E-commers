class Order < ApplicationRecord

  ORDER_PREFIX = 'PO'
  RANDOM_SIZE = 9
  belongs_to :user
  before_create -> {generate_number(RANDOM_SIZE)}

  validates :number, uniqueness: true


  def generate_number(size)
    self.number = loop do 
      rand_str = random_candidate(size)
      break rand_str unless Order.exists?(number: rand_str)
    end
  end

  def random_candidate(size)
    "#{ORDER_PREFIX}#{Array.new(size){rand(size)}.split}"
  end
end
