class Driver < ApplicationRecord
  belongs_to :user


  mount_uploader :license, LicenseUploader
end
