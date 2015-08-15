class LogVolunteer < ActiveRecord::Base
  attr_accessor :log_id, :volunteer_id, :active, :log, :volunteer, :covering
  
  belongs_to :log
  belongs_to :volunteer

  accepts_nested_attributes_for :volunteer

end
