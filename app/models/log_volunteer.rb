class LogVolunteer < ActiveRecord::Base

  belongs_to :log
  belongs_to :volunteer

  accepts_nested_attributes_for :volunteer

  private
  
  def log_volunteer_params
    params.require(:log_volunteer).permit(:log_id, :volunteer_id, :active, :log, :volunteer, :covering)
  end
end
