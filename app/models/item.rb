class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :taste
    with_options format: {with: /\A[0-9]+\z/ , message: "を半角数字で入力してください"} do
      validates :price
      validates :protein
      validates :lipid
      validates :amount
    end
    validates :impression
  end

end
