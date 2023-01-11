require 'rails_helper'

RSpec.describe "Home", type: :request do

  describe 'GET #index' do
    let!(:user) { create(:user) }
    context 'ログインしているとき' do
      include_context 'login_as_user'

        it '年齢と性別に応じて適切な栄養摂取基準を取得できること' do
         expect(user.get_standard).to eq Standard.find_by(id: 9) 
        end

      context 'パラメータが不正なとき' do

      end
    end
    context 'ログインしていないとき' do
      it 'メッセージが投稿できないこと' do

      end
    end
  end
end