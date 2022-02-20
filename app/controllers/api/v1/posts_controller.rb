# namespaceのネスト
module Api
  # namespaceのネスト
  module V1
    class PostsController < ApplicationController
      def create
        post = Post.new(title: "test_title", description: "test_description")
        render json: { status: 'SUCCESS', data: post }
      end
    end
  end
end
