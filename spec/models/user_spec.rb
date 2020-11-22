require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "新規登録がうまくいくとき" do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      ## 正常系は上記の部分のみでOK下記の条件は全て上記3行に含まれているから
      # it "nicknameがあれば登録できる" do
      #   @user.nickname = "test"
      #   expect(@user).to be_valid
      # end

      # it "passwordが英数字両方含めれば登録できる" do
      #   @user.password = "abc000"
      #   @user.password_confirmation = "abc000"
      #   expect(@user).to be_valid
      # end

      # it "passwordが6文字以上であれば登録できる" do
      #   @user.password = "abcdefg000000"
      #   @user.password_confirmation = "abcdefg000000"
      #   expect(@user).to be_valid
      # end

      # it "last_nameが全角文字だと登録できる" do
      #   @user.last_name = "田中"
      #   expect(@user).to be_valid
      # end

      # it "first_nameが全角文字だと登録できる" do
      #   @user.first_name = "太郎"
      #   expect(@user).to be_valid
      # end

      # it "last_name_kaneが全角カナだと登録できる" do
      #   @user.last_name_kana = "タナカ"
      #   expect(@user).to be_valid
      # end

      # it "first_name_kanaが全角カナだと登録できる" do
      #   @user.first_name_kana = "タロウ"
      #   expect(@user).to be_valid
      # end

    end

    context '新規登録がうまくいかないとき' do #異常系
      it 'nicknameが空では登録できない' do
        @user.nickname = ''  # nicknameの値が空
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''  # emailの値を空
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@がない場合は登録できない' do
        @user.email = 'testgmail.com' #@マークなし
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが数字だけだと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが英字だけだと登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation ='abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aa000'
        @user.password_confirmation = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが半角文字だと登録できない' do
        @user.last_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end

      it 'first_nameが半角文字だと登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end

      it 'last_name_kanaが空では登録できkない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaが半角文字だと登録できない' do
        @user.last_name_kana = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end

      it 'first_name_kanaが半角文字だと登録できない' do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end

      it 'last_name_kanaが全角カナ以外だと登録できない' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end

      it 'first_name_kanaが全角カナ以外だと登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end

      it 'birth_dateが空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
