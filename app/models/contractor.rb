require 'digest/md5'

class Contractor < ActiveRecord::Base
  has_many :time_entries
  has_many :projects, :through => :time_entries, :uniq => true

  scope :active, where(:display => true)

  default_scope order: 'name'

  def gravatar_hash
    return false unless email
    Digest::MD5.hexdigest(email.strip.downcase)
  end
end
