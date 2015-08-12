class SchedulePart < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :food_type

  private
  
  def schedule_part_params
    params.require(:schedule_part).permit(:required)
  end
end
