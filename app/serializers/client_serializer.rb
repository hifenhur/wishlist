# == Schema Information
#
# Table name: clients
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ClientSerializer
  include JSONAPI::Serializer
  attributes :name, :email

end
