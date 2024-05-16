require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form =FactoryBot.build(:order_form)
  end

  describe '商品購入情報の保存' do
    context '商品購入情報の保存ができる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it '建物名は空でも保存できること' do
        @order_form.build = nil
        expect(@order_form).to be_valid
      end
    end

    context '商品購入情報の保存ができない場合' do
      it "tokenが空では登録できないこと" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      
      it '郵便番号が空だと保存できないこと' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号がハイフン無しでは保存できないこと' do
        @order_form.post_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it '郵便番号が全角では保存できないこと' do
        @order_form.post_code = '１２３－４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it '都道府県が選択されていないと保存できないこと' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
         
      it '市区町村が空だと保存できないこと' do
        @order_form.municipality= nil
        @order_form.valid?
       expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁未満では保存できないこと' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too short")
      end

      it '電話番号が12桁以上では保存できないこと' do
        @order_form.phone_number = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number", "Phone number is too short")
      end

      it '電話番号にハイフンが含まれていると保存できないこと' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it '電話番号は全角では保存できない' do
        @order_form.phone_number = '０９０１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'user_idが空では登録できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
  
      it 'item_idが空では登録できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end