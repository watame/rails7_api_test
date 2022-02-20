require 'rails_helper'

RSpec.describe Posts, type: :model do
  it '正常な値が設定されている' do
    expect(build(:posts)).to be_valid
  end
end
