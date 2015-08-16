class ScheduleVolunteer < ActiveRecord::Base
  belongs_to :schedule_chain
  belongs_to :volunteer
  
  accepts_nested_attributes_for :volunteer	
end
