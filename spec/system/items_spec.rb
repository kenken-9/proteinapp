require "rails_helper"

RSpec.describe "Items", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  context "投稿に成功したとき" do
    it "ログインしたユーザーは新規投稿できる" do
      # ログインする
      sign_in(@user)

      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content("投稿")

      # 投稿ページに移動
      visit new_item_path

      # フォームに情報を入力
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('item[image]', image_path, make_visible: true)
      fill_in "item-name" ,with: @item.name
      fill_in "item-taste" ,with: @item.taste
      fill_in "item-price" ,with: @item.price
      fill_in "item-amount" ,with: @item.amount
      fill_in "item-protein" ,with: @item.protein
      fill_in "item-lipid" ,with: @item.lipid
      fill_in "item-impression" ,with: @item.impression

      # 送信するとItemモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Item.count}.by(1)
      
      # トップページに遷移することを確認
      expect(current_path).to eq(root_path)

      # 投稿した商品の画像がブラウザに表示されていることを確認する
      expect(page).to have_selector('img')

      # 投稿した商品の商品名と味がブラウザに表示されていることを確認する
      expect(page).to  have_content(@item.name)
      expect(page).to  have_content(@item.taste)
    end

    context "新規投稿ができない時" do
      it "ログインをしていないと投稿ページに遷移できない" do
        # トップページに遷移する
        visit root_path

        # 新規投稿ページへのリンクがない
        expect(page).to have_no_selector("post-btn")
      end
    end


  end

end
