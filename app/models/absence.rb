class Absence < ActiveRecord::Base
  attr_accessor :start_date, :stop_date, :volunteer_id, :comments, :volunteer, :active
  
  belongs_to :volunteer
  has_and_belongs_to_many :logs
  default_scope { where(active:true) }
end