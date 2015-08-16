class TransportType < ActiveRecord::Base
  attr_accessor :region
  
  default_scope { where(active:true) }
end
