class Category.rb < ActiveHash::Base
    self.data = [
        {id: 1,name: "--"},
        {id: 2,name: "はじめての方向け"},
        {id: 3,name: "女性向け"},
        {id:4,name: "筋肉を増強したい方向け"},
        {id:5,name: "スポーツをしている方向け"},
        {id:6,name: "その他"}
    ]

    include ActiveHash::Associations
    has_many :items

end