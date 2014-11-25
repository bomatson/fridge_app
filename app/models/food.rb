class Food < ActiveRecord::Base
  validates :name, length: { maximum: 25 }
  validates_presence_of :name, :food_type, :expiration
  validate :non_dairy

  def non_dairy
    if food_type == 'dairy'
      errors.add(:food_type, 'cannot be dairy')
    end
  end
end
