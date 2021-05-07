require "rails_helper"

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
end
