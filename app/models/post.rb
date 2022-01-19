class Post < ApplicationRecord
  belongs_to :user
  broadcasts
end
