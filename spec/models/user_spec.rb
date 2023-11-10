require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'Creates a User object' do
      user = User.create(name: 'me', email: 'me@code.io', password: 'f4k3p455w0rd')
      expect(user).to be_a(User)
    end

    it 'requires a name' do
      user = User.new(name: nil, email: 'me@code.io', password: 'f4k3p455w0rd')
      expect(user).not_to be_valid
    end

    it 'requires a email' do
      user = User.new(name: 'me', email: nil, password: 'f4k3p455w0rd')
      expect(user).not_to be_valid
    end

    it 'requires a password' do
      user = User.new(name: 'me', email: 'me@code.io', password: nil)
      expect(user).not_to be_valid
    end

    it 'requires a unique email' do
      @me = User.create(name: 'me', email: 'me@code.io', password: 'f4k3p455w0rd')
      @me.confirm
      user = User.new(name: 'user', email: 'me@code.io', password: 'l4m3p455w0rd')
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many categories' do
      user = User.reflect_on_association(:categories)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many payments' do
      user = User.reflect_on_association(:payments)
      expect(user.macro).to eq(:has_many)
    end
  end
end
