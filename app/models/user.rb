class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    #has_many :items
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

    validates :name, presence: true 
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday, presence: true

end
