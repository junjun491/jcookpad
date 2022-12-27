require 'rails_helper'
 RSpec.describe 'ApiV1Post', type: :request do
  let(:post) { create(:post) }
  before { get api_v1_post_path(post.id) }
 it 'statusが200になること' do
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(json['id']).to eq(post.id)
 end
end
