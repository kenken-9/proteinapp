class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user

  with_options presence: true do
    validates :image
    validates :name
    validates :taste
    with_options numericality: { only_integer: true , message: "を半角数字で入力してください"} do
      with_options inclusion: { in: 1..9999999, message: "を1以上で入力してください" } do
        validates :price
        validates :amount
        validates :protein
      end
        validates :lipid
    end
    validates :impression
  end

  def self.search(search)
    if search != ""
      Item.where("(taste LIKE(?)) or (name LIKE(?))  ", "%#{search}%", "%#{search}%")
    else
      Item.all
    end
  end

end

