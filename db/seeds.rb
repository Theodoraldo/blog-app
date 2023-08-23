# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Clear existing data
Comment.delete_all
Like.delete_all
Post.delete_all
User.delete_all

# Users
user1 = User.create!(
  name: "Theodoraldo Gishun",
  photo: "https://unsplash.com/photos/F_-0BxGuVvo",
  bio: "This is User 1's bio. A developer from Poland, specialize in rails.",
  post_counter: 0
)
user2 = User.create!(
  name: "Asimeng Osei",
  photo: "https://unsplash.com/photos/F_-0BxGuVvo",
  bio: "This is User 2's bio. A developer from Ghana, specialize in react.",
  post_counter: 0
)

# Posts
post1 = Post.create!(
  title: "Post 1",
  text: "This is the content of Post 1.",
  comments_counter: 0,
  likes_counter: 0,
  author_id: user1.id
)
post2 = Post.create!(
  title: "Post 2",
  text: "This is the content of Post 2.",
  comments_counter: 0,
  likes_counter: 0,
  author_id: user2.id
)

# Comments
Comment.create!(
  text: "This is a comment on Post 1.",
  user: user2,
  post: post1
)
Comment.create!(
  text: "This is another comment on Post 1.",
  user: user1,
  post: post1
)

# Likes
Like.create!(
  user: user1,
  post: post2
)
Like.create!(
  user: user2,
  post: post2
)
