require 'rails_helper'
require 'support/utilities'
require 'shared/login'


RSpec.describe "Home", type: :request do
  before do

  end
    describe 'GET #index' do

      context 'ログインしているとき' do
        include_context 'login_as_user'
  
          it 'ログインユーザの年齢と性別に応じて適切な栄養摂取基準を取得できること' do
           expect(login_user.get_standard).to eq Standard.find_by(id: 9) 
           get posts_path
           expect(response).to have_http_status 200
          end
      end

      context 'ログインしていないとき' do
        it '問題なくhttp通信できること' do
          get posts_path
          expect(response).to have_http_status 200
         end


      end
    end
end