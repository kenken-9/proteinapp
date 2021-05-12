require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがある
      expect(page).to have_content('新規登録')

      # 新規登録ページに移動する
      visit new_user_registration_path

      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password_confirmation', with: @user.password_confirmation
      fill_in 'profile', with: @user.profile

      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect  do
        find('input[name="commit"] ').click
      end.to change { User.count }.by(1)

      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)

      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')

      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end

    it '誤った情報ではユーザー新規登録ができずに新規登録ページに戻ってくる' do
      # トップページに移動する
      visit root_path

      # トップページにサインアップページへ遷移するボタンがある
      expect(page).to have_content('新規登録')

      # 新規登録ページに移動する
      visit new_user_registration_path

      # ユーザー情報を入力する
      fill_in 'nickname', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      fill_in 'password_confirmation', with: ''
      fill_in 'profile', with: ''

      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(0)

      # 新規登録ページに戻されることを確認
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインできる時' do
    it '保存されているユーザー情報と合致すればログインできる' do
      # トップページに遷移する
      visit root_path

      # トップページにログインへ遷移するボタンがある
      expect(page).to have_content('ログイン')

      # ログインページに遷移する
      visit new_user_session_path

      # 正しいユーザー情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password

      # ログインボタンをおす
      find('input[name="commit"]').click

      # トップページに移動したことを確認
      expect(current_path).to eq(root_path)

      # ログアウトが表示されていることを確認
      expect(page).to have_content('ログアウト')

      # 新規登録ボタンやログインボタンが表示されていないことを確認
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ログインできない時' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに遷移する
      visit root_path

      # トップページにログインへ遷移するボタンがある
      expect(page).to have_content('ログイン')

      # ログインページに遷移する
      visit new_user_session_path

      # 誤ったユーザー情報を入力する
      fill_in 'email', with: ''
      fill_in 'password', with: ''

      # ログインボタンをおす
      find('input[name="commit"]').click

      # ログインページに戻されることを確認
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
