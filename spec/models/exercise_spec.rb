# == Schema Information
#
# Table name: exercises
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  machine_weight      :integer
#  split               :boolean          default(FALSE)
#  record_per_dumbbell :boolean          default(FALSE)
#  created_at          :datetime
#  updated_at          :datetime
#

require 'spec_helper'

describe Exercise do
  pending "add some examples to (or delete) #{__FILE__}"
end
