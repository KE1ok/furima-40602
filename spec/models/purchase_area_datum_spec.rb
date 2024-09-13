require 'rails_helper'

RSpec.describe PurchaseAreaDatum, type: :model do
  before do

    @purchase_area_datum = FactoryBot.build(:purchase_area_datum)
  end
  describe '商品購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_area_datum).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_area_datum.building_name = ''
        expect(@purchase_area_datum).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '配送先の住所情報も購入の都度入力させること' do
        
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase_area_datum.postal_code = ''
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_area_datum.postal_code = 0160000
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Postal code は3桁-4桁のハイフンを含む半角数字で入力してください")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_area_datum.prefecture_id = 1
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_area_datum.municipalities = ''
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @purchase_area_datum.street = ''
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Street can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @purchase_area_datum.telephone = ''
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneは、10桁以上の半角数値のみ保存可能なこと' do
        @purchase_area_datum.telephone = "123456789"
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneは、11桁以内の半角数値のみ保存可能なこと' do
        @purchase_area_datum.telephone = "090111122223"
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneは、10桁以上11桁以内の半角数値のみ(ハイフンを含まない)保存可能なこと' do
        @purchase_area_datum.telephone = "090-1111-2222"
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'priceが空では登録できないこと' do
        @purchase_area_datum.price = nil
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Price can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_area_datum.token = nil
        @purchase_area_datum.valid?
        expect(@purchase_area_datum.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end