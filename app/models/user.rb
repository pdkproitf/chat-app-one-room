class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable


  NAME_REGEX = /\w+/
  validates :username,  presence: true, uniqueness: { case_sensitive: false },
                        format: { with: /\A#{NAME_REGEX}\z/i },
                        length: { maximum: 15 }
  has_many :messages
end
