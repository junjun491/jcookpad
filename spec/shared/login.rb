RSpec.shared_context 'login as user' do
    let(:login_user) { create :user }
    before { sign_in_as login_user }
  end