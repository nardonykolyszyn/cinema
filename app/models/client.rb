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

class Client < ApplicationRecord
end
