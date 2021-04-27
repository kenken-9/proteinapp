class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :taste
    with_options format: {with: /\A[0-9]+\z/ , message: "を半角数字で入力してください"} do
      with_options inclusion: { in: 1..9999999, message: "を1以上で入力してください" } do
        validates :price
        validates :amount
        validates :protein
      end
      validates :lipid
    end
    validates :impression
  end

end
