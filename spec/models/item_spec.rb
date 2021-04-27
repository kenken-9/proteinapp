require "rails_helper"

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品投稿機能" do 

    context "商品投稿ができる時" do 

      it "name,taste,price,protein,lipid,amount,impressionがあれば登録できる" do
      expect(@item).to be_valid
      end

      it "priceは半角英数字のみ登録できる" do
        @item.price = 999
        expect(@item).to be_valid
      end

      it "proteinは半角英数字のみ登録できる" do
        @item.protein = 999
        expect(@item).to be_valid
      end

      it "lipidは半角英数字の0でも登録できる" do
        @item.lipid = 0
        expect(@item).to be_valid
      end

      it "amountは半角英数字のみ登録できる" do
        @item.amount = 999
        expect(@item).to be_valid
      end
     end

     context "商品投稿ができない時" do
       
      it "商品画像が空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it "プロテイン名が空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("プロテイン名を入力してください")
      end

      it "味が空では登録できない" do
        @item.taste = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("味を入力してください")
      end

      it "価格が空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it "内容量が空では登録できない" do
        @item.amount = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("内容量を入力してください")
      end

      it "タンパク質量が空では登録できない" do
        @item.protein = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("タンパク質の量を入力してください")
      end

      it "脂質量が空では登録できない" do
        @item.lipid = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("脂質の量を入力してください")
      end

      it "おすすめのポイントが空では登録できない" do
        @item.impression = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("おすすめのポイントを入力してください")
      end

      it "価格は半角数字以外では登録できない" do
        @item.price = "８８８"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を半角数字で入力してください")
      end

      it "内容量は半角数字以外では登録できない" do
        @item.amount = "８８８"
        @item.valid?
        expect(@item.errors.full_messages).to include("内容量を半角数字で入力してください")
      end

      it "タンパク質量は半角数字以外では登録できない" do
        @item.protein = "８８８"
        @item.valid?
        expect(@item.errors.full_messages).to include("タンパク質の量を半角数字で入力してください")
      end

      it "脂質は半角数字以外では登録できない" do
        @item.lipid = "８８８"
        @item.valid?
        expect(@item.errors.full_messages).to include("脂質の量を半角数字で入力してください")
      end

      it "価格は0では登録できない" do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を1以上で入力してください")
      end

      it "内容量は0では登録できない" do
        @item.amount = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("内容量を1以上で入力してください")
      end

      it "タンパク質は0では登録できない" do
        @item.protein = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("タンパク質の量を1以上で入力してください")
      end
    end
  end
end
