require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    before do
      @me2 = User.create(name: 'me2', email: 'me2@code.io', password: 'f4k3p455w0rd')
      @me2.confirm
    end

    it 'creates a category object' do
      category = Category.create(name: 'Test', icon: 'fa-solid fa-gears', user_id: @me2.id)
      expect(category).to be_a(Category)
    end

    it 'requiers a name' do
      category = Category.create(name: nil, icon: 'fa-solid fa-gears', user_id: @me2.id)
      expect(category).not_to be_valid
    end

    it 'requires an icon' do
      category = Category.create(name: 'Test', icon: nil, user_id: @me2.id)
      expect(category).not_to be_valid
    end

    it 'requires a user id' do
      category = Category.create(name: 'Test', icon: 'fa-solid fa-gears', user_id: nil)
      expect(category).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      category = Category.reflect_on_association(:user)
      expect(category.macro).to eq(:belongs_to)
    end

    it 'has many category payments' do
      category = Category.reflect_on_association(:category_payments)
      expect(category.macro).to eq(:has_many)
    end
  end
end
