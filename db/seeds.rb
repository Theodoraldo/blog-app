# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')


first_post = Post.create(author_id: 1, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author_id: 2, title: 'Hi', text: 'This is my second post')
third_post = Post.create(author_id: 1, title: 'Peer', text: 'This is my third post')
forth_post = Post.create(author_id: 1, title: 'Dude', text: 'This is my fourth post')
fifth_post = Post.create(author_id: 2, title: 'Heh', text: 'This is my fifth post')

Comment.create(post_id: 1, user_id: 1, text: 'Hi Tom!' )
Comment.create(post_id: 2, user_id: 2, text: 'Hi Tom!' )
Comment.create(post_id: 3, user_id: 1, text: 'Hi Tom!' )
Comment.create(post_id: 4, user_id: 2, text: 'Hi Tom!' )
Comment.create(post_id: 5, user_id: 1, text: 'Hi Tom!' )
Comment.create(post_id: 1, user_id: 2, text: 'Hi Tom!' )