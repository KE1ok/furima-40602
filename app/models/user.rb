class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶー－一-龠]+\z/ }, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶー－一-龠]+\z/ }, presence: true
  validates :last_ruby, format: { with: /\A[ァ-ヶー]+\z/ }, presence: true
  validates :first_ruby, format: { with: /\A[ァ-ヶー]+\z/ }, presence: true
  validates :birthday, presence: true
end
