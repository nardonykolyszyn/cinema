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

FactoryBot.define do
  factory :show_function do
    function { nil }
    client { nil }
    starts_at { "2019-07-29 00:41:52" }
    ends_at { "2019-07-29 00:41:52" }
  end
end
