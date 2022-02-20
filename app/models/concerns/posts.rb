class Posts
  include ActiveModel::Model
  attr_accessor :title,
                :description

  with_options presence: true do
    validates :title, length: { maximum: 255 }
    validates :description, length: { maximum: 2_000 }
  end
end