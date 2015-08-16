class ScaleType < ActiveRecord::Base
  has_many :logs
  belongs_to :region

  default_scope { where(active:true) }

  def self.regional(region_id)
    where(:region_id=>region_id)
  end

end
