class ScheduleVolunteer < ActiveRecord::Base
	belongs_to :schedule_chain
  belongs_to :volunteer
  
	accepts_nested_attributes_for :volunteer	

  private
  
  def schedule_volunteer_params
    params.require(:schedule_volunteer).permit(:schedule_chain_id, :volunteer_id, :active)
  end
end
