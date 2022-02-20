require 'rails_helper'

RSpec.describe Post, type: :model do
  it '正常な値が設定されている' do
    expect(build(:post)).to be_valid
  end
end
