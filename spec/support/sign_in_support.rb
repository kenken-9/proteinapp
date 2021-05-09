module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
  end

  def sign_in1(user)
    visit new_user_session_path
      fill_in "email", with: @item1.user.email
      fill_in "password", with: @item1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
  end

end
