class SchedulePart < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :food_type

  attr_accessor :required
end
