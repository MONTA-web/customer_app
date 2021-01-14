require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー登録がうまく行くとき' do
      it "全ての値が正しく入力されている時、登録することができる" do
        @user.save
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録がうまくいかない時' do
      it "nameが空だと登録することができない" do
        @user.name=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "emailが空だと登録することができない" do
        @user.email=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空だと登録することができない" do
        @user.password=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end

      it "passwordが6桁以上でないと登録することができない" do
        @user.password="12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
          "Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空だと登録することができない" do
        @user.password_confirmation=""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordとpassword_confirmationは同じでないと登録することができない" do
        @user.password="123456"
        @user.password_confirmation="234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

  end
end
