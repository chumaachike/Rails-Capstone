require 'rails_helper'
RSpec.describe User, type: :model do
  context "validation tests" do
  user = User.new(name: 'Anyone')
  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end
  it 'Name must not be blank' do
    user.name = ' '
    expect(user).to_not be_valid
  end
end
  context "creation tests"do
    it "should create a new user" do
      user = User.create(name: "achike")
      expect(user.name).to eq("achike")
    end
  end
end