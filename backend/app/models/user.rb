class User
    include Mongoid::Document
    include ActiveModel::SecurePassword
  
    field :first_name, type: String
    field :last_name, type: String
    field :username, type: String
    field :email, type: String
    field :password_digest, type: String
  
    has_secure_password
  
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
    
  end
