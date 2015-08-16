class Absence < ActiveRecord::Base
  belongs_to :volunteer
  has_and_belongs_to_many :logs
  default_scope { where(active:true) }
end