class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :bookmarks, dependent: :destroy
  
  with_options presence: true do
    validates :nickname
    validates :profile
  end

  validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message:"を6文字以上の半角英数字で入力してください" }

  # お気に入り登録のメソッド
  def bookmark(item)
    Bookmark.create!(user_id: id, item_id: item.id)
  end

  # お気に入り登録を解除する
  def unbookmark(item)
    Bookmark.find_by(user_id: id, item_id: item.id).destroy
  end

  # 現在のユーザーがお気に入り登録していたらtrueを返す
  def bookmark?(item)
    !Bookmark.find_by(user_id: id, item_id: item.id).nil?
  end
  


end
