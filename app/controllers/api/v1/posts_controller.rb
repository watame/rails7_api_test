# namespaceのネスト
module Api
  # namespaceのネスト
  module V1
    # 投稿機能コントローラークラス
    class PostsController < ApplicationController
      def create
        # 受け取るパラメータはRailsの仕様で以下のように改変される
        #   送信内容: { "title": "test title", "description": "test description" }
        #   params: {"title"=>"test title", "description"=>"test description", "post"=>{"title"=>"test title", "description"=>"test description"}}
        # https://railsguides.jp/action_controller_overview.html#json%E3%83%91%E3%83%A9%E3%83%A1%E3%83%BC%E3%82%BF
        post = Post.new(post_params)
        render json: post, status: :ok
      end

      private

      def post_params
        params.require(:post).permit(:title, :description)
      end
    end
  end
end
