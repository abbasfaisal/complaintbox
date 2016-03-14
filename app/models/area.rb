class Area < ActiveRecord::Base
  validates :areaname, :presence => true, :uniqueness => true
  has_many :complaints
end
