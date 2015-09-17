require 'spec_helper'

describe 'User' do
  let(:new_user) {User.new(display_name: "Edgar", email: "edgar@gmail.com", password: password)}

  describe 'password' do
    context 'password is nil' do
      let(:password) {""}
      it 'should be invalid' do
        expect(new_user).not_to be_valid
      end

      let(:password) {nil}
      it 'should be invalid' do
        expect(new_user).not_to be_valid
      end

    end

    context 'password has a value' do
      let(:password) {"1234"}
      it 'should be valid' do
        expect(new_user).to be_valid
      end
    end
  end

  describe '#authenticate' do
    let(:password) {"1234"}
    context 'password matches' do
      it 'should be true' do
        expect(new_user.authenticate(password)).to eq true
      end
    end

    context 'password does not match' do
      it 'should be false' do
        expect(new_user.authenticate("5555")).to eq false
      end
    end
  end

end