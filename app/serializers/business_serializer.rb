class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :business_type, :status, :status
  has_many :products
end