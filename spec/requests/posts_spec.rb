require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "#create" do
    before do 
      post api_v1_posts_path
    end

    it "モデルの結果が取得できる" do
      expect(response).to have_http_status(200)
    end
  end
end
