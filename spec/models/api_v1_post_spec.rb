require 'rails_helper'

RSpec.describe ApiV1Post, type: :model do
 it 'statusが200になること' do
    get '/api/v1/posts'
    json = JSON.parse(response.body)
    expect(response.status).to eq(200)
 end

# it 'responseの中身が正しいこと' do
# end
end
