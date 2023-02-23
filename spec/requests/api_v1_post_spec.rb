require 'rails_helper'
RSpec.describe 'ApiV1Post', type: :request do
   describe 'ApiV1Post#show' do
      let(:post) { create(:post) }
      before { get api_v1_post_path(post.id) }

      it 'idでgetリクエストしたpost(レシピ)の中身も問題なくリクエストしたものであること(代表で名前のみチェック)' do
         json = JSON.parse(response.body)
         expect(json['rname']).to eq(post.rname)
      end

      it 'httpのリクエストが成功し,statusが200のレスポンスがかえってくること' do
         expect(response.status).to eq(200)
      end
   end
end
