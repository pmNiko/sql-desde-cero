

table user {
  id int [pk, increment]
  email varchar
  password varchar 
  profile_id int [ref: > profile.id]

  created_at timestamp [default:  'now()']
}


table profile {
  id int [pk, increment]
  name varchar
  nick varchar
  description varchar
  links varchar[]
  bio TEXT
  avatar_url VARCHAR(255)
  location VARCHAR(100) 
}


table tweet {
  id int [pk, increment]
  title varchar [not null]
  content text [not null]
  user_id int [ref: > user.id]

  created_at timestamp [default:  'now()']
}


table follower {
  follower_id int [ref: > user.id, not null] 
  followed_id int [ref: > user.id, not null] 
  created_at timestamp [default: 'now()']
  indexes {
    (follower_id, followed_id) [unique] 
  }
}


