# == Schema Information
#
# Table name: show_functions
#
#  id          :bigint           not null, primary key
#  function_id :bigint
#  starts_at   :datetime
#  ends_at     :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  client_id   :bigint
#

require 'rails_helper'

RSpec.describe ShowFunction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
