require 'rails_helper'

RSpec.describe "Home", type: :request do

    describe 'GET #index' do

      before do
        get posts_path
      end

      context 'ログインしているとき' do
        let(:login_user) { create :user }
        before { sign_in(login_user) }

        it 'ログインユーザの年齢と性別に応じて適切な栄養摂取基準を取得できること' do
          expect(login_user.get_standard).to eq Standard.find_by(id: 9) 
        end

        it '問題なくhttp通信ができること' do
          expect(response).to have_http_status 200
        end

      end

      context 'ログインしていないとき' do
        it '問題なくhttp通信できること' do
          expect(response).to have_http_status 200
        end
      end
    end
end
