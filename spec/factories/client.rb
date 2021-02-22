# == Schema Information
#
# Table name: cycles
#
#  id         :bigint(8)        not null, primary key
#  program_id :bigint(8)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :client do
    name { "João"}
    email { "joao@gmail.com"}
  end
end
