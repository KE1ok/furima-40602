class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶー－一-龠]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶー－一-龠]+\z/ }
    validates :last_ruby, format: { with: /\A[ァ-ヶー]+\z/ }
    validates :first_ruby, format: { with: /\A[ァ-ヶー]+\z/ }
    validates :birthday
  end
  validate :password_must_be_alphanumeric

  private

  # 半角英数字混合のバリデーション
  def password_must_be_alphanumeric
    return if password.blank? # パスワードが空の場合はバリデーションをスキップ

    return if password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/)

    errors.add(:password, 'must be a mix of letters and numbers')
  end
end
