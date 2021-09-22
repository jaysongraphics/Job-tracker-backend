class User < ApplicationRecord
    has_many :applications
    has_many :jobs, through: :applications
    has_many :resumes
    has_secure_password
end
