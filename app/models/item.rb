class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :image
    validates :name
    validates :taste
    with_options inclusion: { in: 1..9_999_999, message: 'を1以上で入力してください' } do
      validates :protein
      with_options numericality: { only_integer: true, message: 'を半角数字で入力してください' } do
        validates :price
        validates :amount
      end
    end
    with_options numericality: { only_float: true, message: 'を半角数字で入力してください' } do
      validates :lipid
      validates :protein
    end
    validates :impression
  end

  validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }

  def self.search(search)
    if search != ''
      Item.where('(taste LIKE(?)) or (name LIKE(?))  ', "%#{search}%", "%#{search}%")
    else
      Item.all
    end
  end
end
