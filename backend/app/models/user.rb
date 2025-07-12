class User < ApplicationRecord
    # enables password authentication using password_digest
    has_secure_password

    # validations
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    # more validations here...
end
