class ScaleType < ActiveRecord::Base
  attr_accessor :name, :region_id, :weight_unit
  
  has_many :logs
  belongs_to :region

  default_scope { where(active:true) }

  def self.regional(region_id)
    where(:region_id=>region_id)
  end

end
