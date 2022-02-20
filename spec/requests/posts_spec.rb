require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "#create" do
    before do 
      post api_v1_posts_path
    end

    it "正常なレスポンスが戻ってくる" do
      expect(response).to have_http_status(:ok)
    end

    it "正しい形式でレスポンスが戻ってくる" do
      # レスポンス確認の過程でステータスコードの指定が必須のため、200を入れる
      # ※`:ok`等のステータスコードHashは利用できないので注意！
      assert_response_schema_confirm(200)
    end
  end
end
