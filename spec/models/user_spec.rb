require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    # тестируем, что модель проверяет наличие параметров и выводит соответствующее сообщение
    it { should validate_presence_of(:email).with_message("can't be blank") }
    it { should validate_presence_of(:name).with_message("can't be blank") }
    it { should validate_presence_of(:password).with_message("can't be blank") }
  end

  describe 'working with db' do
    it 'should save user' do
      user = User.new(email: 'testexample.com', name: 'test', password_digest: '123')
      expect(user.save).to eq(true)
      User.last.destroy
    end
  end
end
