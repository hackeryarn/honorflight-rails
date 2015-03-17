class Contact < ActiveRecord::Base
  attr_encrypted :phone, :email, :alternate_phone, :relationship, key: "my key"

  belongs_to :address

  belongs_to :person
  belongs_to :contact_category

  accepts_nested_attributes_for :address
end
