class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    #     has_many :histories 後で多分必要？？
         has_many :products
       
         validates :nickname, presence: true
       
       
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, presence: true, length: { minimum: 6 }, confirmation: true, \
                              format: { with: PASSWORD_REGEX, message: 'は英字と数字の両方を含めて設定してください' }
       
         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龠々]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）を使用してください' } do
           validates :last_name
           validates :first_name
         end
       
         with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'は全角（カタカナ）を使用してください' } do
           validates :last_name_kana
           validates :first_name_kana
         end
       
         validates :birthday, presence: true
       



end
