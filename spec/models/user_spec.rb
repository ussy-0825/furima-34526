require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'nickname、email、password、password(確認用)、名前(全角)、名前(カタカナ)、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空の時、登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空の時、登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it '入力したemailが登録済の場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'emailに@が含まれていない場合、登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("メールアドレスは不正な値です")
      end
      it 'passwordが空の時、登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが6文字未満の時、登録できない' do
        @user.password = 'a1'
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワードは6文字以上で入力してください")
      end
      it 'passwordが全角英数字の場合、登録できない' do
        @user.password = 'AAA１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは文字と数字の両方が含まれている必要があります')
      end
      it 'passwordが半角英字、半角数字それぞれ1文字以上含めていない場合、登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは文字と数字の両方が含まれている必要があります')
      end
      it 'passwordが半角英字、半角数字それぞれ1文字以上含めていない場合、登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは文字と数字の両方が含まれている必要があります')
      end
      it '確認用のpasswordを入力していない時、登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordと確認用passwordが一致していない時、登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが空の時、登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it 'last_nameが漢字、平仮名、カタカナ以外の場合、登録できない' do
        @user.last_name = '@@@'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は全角で入力してください')
      end
      it 'first_nameが空の時、登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end
      it 'first_nameが漢字、平仮名、カタカナ以外の場合、登録できない' do
        @user.first_name = '@@@'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は全角で入力してください')
      end
      it 'last_name_kanaが空の時、登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）を入力してください")
      end
      it 'last_name_kanaが全角カタカナ以外の場合、登録できない' do
        @user.last_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓（カナ）は全角で入力してください')
      end
      it 'first_name_kanaが空の時、登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）を入力してください")
      end
      it 'first_name_kanaが全角カタカナ以外の場合、登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('名（カナ）は全角で入力してください')
      end
      it 'birthdayが空の時、登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
