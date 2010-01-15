atom_feed do |feed|
  feed.title(User.find(@posts.first.user_id).login.pluralize.to_s + ' Blog')
  feed.updated(@posts.first.created_at)
  feed.website("http://drecksau.at")
  
  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, :type => 'html')
      entry.author {(User.find(post.user_id).login)}
    end
  end
end