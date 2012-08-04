class Project < ActiveRecord::Base
  has_many :time_entries
  has_many :contractors, :through => :time_entries, :uniq => true

  scope :active, where(:display => true)
  default_scope order: 'virtual DESC, name'
end
