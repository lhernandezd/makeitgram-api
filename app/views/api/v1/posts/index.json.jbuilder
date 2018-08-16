json.posts @posts do |post|
  json.partial! 'post', locals: { post: post }
  json.user do
    json.partial! 'api/v1/users/user', locals: { user: post.user }
  end
end 