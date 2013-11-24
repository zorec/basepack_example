# == Schema Information
#
# Table name: versions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Version < ActiveRecord::Base
  belongs_to :project, inverse_of: :versions
  has_many :issues, inverse_of: :version

end
