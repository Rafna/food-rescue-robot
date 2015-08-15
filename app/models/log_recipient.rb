class LogRecipient < ActiveRecord::Base
  attr_accessor :log_id, :recipient_id, :active, :log, :recipient
  
  belongs_to :log
  belongs_to :recipient, :class_name => "Location", :foreign_key => "recipient_id"

  accepts_nested_attributes_for :recipient

end