class ScheduleVolunteer < ActiveRecord::Base
  attr_accessor :schedule_chain_id, :volunteer_id, :active
  
  belongs_to :schedule_chain
  belongs_to :volunteer
  
  accepts_nested_attributes_for :volunteer	
end
