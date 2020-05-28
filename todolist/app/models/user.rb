class User < ActiveRecord::Base
  has_secure_password
  has_many :tasks
  validates :email, presence: true
  before_save :downcase_fields
  before_create :downcase_fields
  def downcase_fields
    self.name = name.downcase
  end
end
