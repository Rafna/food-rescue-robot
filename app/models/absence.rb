class Absence < ActiveRecord::Base
  belongs_to :volunteer
  has_and_belongs_to_many :logs
  default_scope { where(active:true) }

  private
  
  def absence_params
    params.require(:absence).permit(:start_date, :stop_date, :volunteer_id, :comments, :volunteer, :active)
  end
end