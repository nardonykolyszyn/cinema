# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  name       :string
#  year       :integer
#  gender     :integer          default("horror")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :movie do
    name { "MyString" }
    year { 1 }
    gender { 1 }
  end
end
