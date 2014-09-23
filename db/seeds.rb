# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(email: 'nine@gallifrey.net', password: 'fantastic')
u2 = User.create(email: 'ten@gallifrey.net', password: 'allonsy')
u3 = User.create(email: 'eleven@gallifrey.net', password: 'geronimo')

b1 = u1.blogs.create(title: 'My Other Car Is A Time Machine', url: 'policebox')
b5 = u1.blogs.create(title: 'Bad Wolf', url: 'badwolf')
b4 = u1.blogs.create(title: 'Time War Winners Club', url: 'nodaleks')

b2 = u2.blogs.create(title: 'Brainy Specs', url: 'weeellll')
b3 = u3.blogs.create(title: 'Wibbly Wobbly Timey Wimey', url: 'wibblylever')

p1 = b1.posts.create(author_id: 1, title: 'Do You Wanna Come With Me?', body: "Cause if you do, then I should warn you — you're gonna see all sorts of things. Ghosts from the past. Aliens from the future. The day the Earth died in a ball of flame. It won't be quiet, it won't be safe, and it won't be calm. But I'll tell you what it will be: the trip of a lifetime!")
p2 = b1.posts.create(author_id: 1, title: 'On Mannequins', body: "They're made of plastic. Living plastic creatures. They're being controlled by a relay device on the roof. Which would be a great big problem if--[he pulls a beeping bomb out of his coat] --I didn't have this. So I'm gonna go upstairs and blow it up. And I might well die in the process. But don't worry about me, no. You go home, go on! Go and have your lovely beans on toast. [suddenly serious] Don't tell anyone about this, 'cos if you do, you'll get them killed. [closes the door, then opens it again] I'm the Doctor, by the way. What's your name?")
p3 = b1.posts.create(author_id: 1, title: 'I Was Fantastic!', body: 'And do you know what? So were you.')
