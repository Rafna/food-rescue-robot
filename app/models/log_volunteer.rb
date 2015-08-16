class LogVolunteer < ActiveRecord::Base
  belongs_to :log
  belongs_to :volunteer

  accepts_nested_attributes_for :volunteer

end
