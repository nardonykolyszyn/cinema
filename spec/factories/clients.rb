# == Schema Information
#
# Table name: clients
#
#  id              :bigint           not null, primary key
#  first_name      :string
#  last_name       :string
#  document_type   :integer          default(0)
#  document_number :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :client do
    first_name { "MyString" }
    last_name { "MyString" }
    document_type { 1 }
    document_number { "MyString" }
  end
end
