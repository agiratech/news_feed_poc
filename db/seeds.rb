
# Default data

u1 = User.create(user_name: "Saran", geo_location: "Chennai")
u2 = User.create(user_name: "Venky", geo_location: "Chennai")
u3 = User.create(user_name: "Reddy", geo_location: "Chennai")

Follower.create(user_id: u1.id, friend_id: u2.id)
Follower.create(user_id: u1.id, friend_id: u3.id)
Follower.create(user_id: u2.id, friend_id: u3.id)
Follower.create(user_id: u3.id, friend_id: u1.id)

Post.create(user_id: u1.id, description: "Welcome")
Post.create(user_id: u2.id, description: "Hello")
Post.create(user_id: u3.id, description: "Thanks")