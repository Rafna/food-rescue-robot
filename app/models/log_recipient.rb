class LogRecipient < ActiveRecord::Base

  belongs_to :log
  belongs_to :recipient, :class_name => "Location", :foreign_key => "recipient_id"

  accepts_nested_attributes_for :recipient

  private
  
  def log_recipient_params
    params.require(:log_recipient).permit(:log_id, :recipient_id, :active, :log, :recipient)
  end
end