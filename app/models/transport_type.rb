class TransportType < ActiveRecord::Base
  default_scope { where(active:true) }

  attr_accessor :name, :region
end
