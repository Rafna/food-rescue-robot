class TransportType < ActiveRecord::Base
  default_scope { where(active:true) }
end
