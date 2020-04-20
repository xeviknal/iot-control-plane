require 'spec_helper.rb'
require './devices/smartphone/user'
require './devices/smartphone/messages/users/login'
require './devices/smartphone/messages/users/logout'

describe User do
  let(:user) { User.new 'test@test.com' }

  context '.login' do
    let(:time) { Time.mktime(2020,04,19) }
    let(:msg) { double('UserLoginMessage') }

    before do
      expect(Time).to receive(:now).and_return(time)
      expect(UserLoginMessage).to receive(:new).with('test@test.com').and_return(msg).once
      expect(msg).to receive('send!').once

      user.login
    end

    it 'changes last_login_at' do
      expect(user.last_login_at).to eq time
    end
  end

  context '.logout' do
    let(:time) { Time.mktime(2020,04,19) }
    let(:msg) { double('UserLogoutMessage') }

    before do
      expect(Time).to receive(:now).and_return(time)
      expect(UserLogoutMessage).to receive(:new).with('test@test.com').and_return(msg).once
      expect(msg).to receive('send!').once

      user.logout
    end

    it 'changes last_login_at' do
      expect(user.last_logout_at).to eq time
    end
  end
end
