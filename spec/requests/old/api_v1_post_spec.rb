require 'rails_helper'
 RSpec.describe 'ApiV1Post', type: :request do
  before do
    @post= FactoryBot.create(:post)
    get api_v1_post_path(@post.id)
  end

 it 'statusが200になること' do
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json['id']).to eq(@post.id)
 end
end
