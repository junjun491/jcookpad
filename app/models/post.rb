class Post < ApplicationRecord
  user_id :integer
  rname :string
  rinformation :text
  rimage :string
  ingredient :text
  procedure_1 :text
  procedure_2 :text
  procedure_3 :text
end
