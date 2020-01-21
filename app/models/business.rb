class Business < ApplicationRecord
 validates :person_name, :business_name, :business_gst_number, presence: true
end
