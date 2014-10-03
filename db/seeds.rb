User.create!([
  {email: "guest@flux-capacitr.com", password: "welcome", username: "timely-guest", username: "chrono-blogger", avatar_url: "https://www.filepicker.io/api/file/v06PjfwSnGdqWfJjxiPz", slug: "chrono-blogger"},
  {email: "calvin@watterson.com", password: "calvin", username: "spaceman-spiff", avatar_url: "https://www.filepicker.io/api/file/aX0jRYHnQGicFIBKLCkV", slug: "spaceman-spiff"},
  {email: "rick@adultswim.com", password: "rickrick", username: "rickdiculous", avatar_url: "https://www.filepicker.io/api/file/oCxbqJtRJW80KEybnspj", slug: "rickdiculous"},
  {email: "bill@stallyns.net", password: "billbill", username: "bill-esque", avatar_url: "https://www.filepicker.io/api/file/6hj7Fz0mS4uoeGT5ruKN", slug: "bill-esque"},
  {email: "morty@adultswim.com", password: "mortymorty", username: "mortyfied", avatar_url: "https://www.filepicker.io/api/file/00JZiscISfOTLVAjRxEd", slug: "mortyfied"},
  {email: "ted@stallyns.net", password: "tedted", username: "ted-like-whoa", avatar_url: "https://www.filepicker.io/api/file/qMCI8WliRMC2l643RJCD", slug: "ted-like-whoa"},
  {email: "abe@whitehouse.gov", password: "lincoln", username: "honest-abe", avatar_url: "https://www.filepicker.io/api/file/u4THIK9uQxOPX9Ke4Qny", slug: "honest-abe"},
  {email: "t2@skynet.gov", password: "arnold", username: "t-800", avatar_url: "https://www.filepicker.io/api/file/3LP299IWTTeMXnFEdYUh", slug: "t-800"},
  {email: "eleven@gallifrey.net", password: "mattsmith", username: "geronimo", avatar_url: "https://www.filepicker.io/api/file/vsUCvKDlQM2imFNK5awt", slug: "geronimo"},
  {email: "doc@future.com", password: "docdoc", username: "great-scott", avatar_url: "https://www.filepicker.io/api/file/U0wo1NzgRGWquG77k7KA", slug: "great-scott"},
  {email: "amy@tardis.com", password: "amyamy", username: "amy-pond", avatar_url: "https://www.filepicker.io/api/file/FskFFwTYT9y7nVivsqRI", slug: "amy-pond"},
  {email: "marty@future.com", password: "martymarty", username: "mcfly-guy", avatar_url: "https://www.filepicker.io/api/file/1dv52xgCR4Cdno2FkTsa", slug: "mcfly-guy"},
  {email: "dalek@dalek.dalek", password: "dalekdalek", username: "x-terminate", avatar_url: "https://www.filepicker.io/api/file/gknDxKkeQlaIInuDTHkz", slug: "x-terminate"},
  {email: "one@gallifrey.net", password: "hartnell", username: "the-good-doctor", avatar_url: "https://www.filepicker.io/api/file/O1xTdHAARCWcEIAmfXFA", slug: "the-good-doctor"},
  {email: "rory@tardis.com", password: "roryrory", username: "rory-the-roman", avatar_url: "https://www.filepicker.io/api/file/1uRNIk1VS46ITKz1rOjJ", slug: "rory-the-roman"},
  {email: "winston@downing.gov", password: "winston", username: "churchill-caesar", avatar_url: "https://www.filepicker.io/api/file/7kNoIGtwT3WxMZIpsSw4", slug: "churchill-caesar"},
  {email: "nine@gallifrey.net", password: "eccleston", username: "fantastic", avatar_url: "https://www.filepicker.io/api/file/59k0JqU3Qmm3GQIyOKeG", slug: "fantastic"},
  {email: "ten@gallifrey.net", password: "tennant", username: "allons-y", avatar_url: "https://www.filepicker.io/api/file/UcQuiLUTS7WFGo75rKUD", slug: "allons-y"},
  {email: "looper@sonypictures.com", password: "brucebruce", username: "looper", avatar_url: "https://www.filepicker.io/api/file/VL3XKVzlSjGGiJ4NPyIq", slug: "looper"},
  {email: "looper2@sonypictures.com", password: "joseph", username: "the-real-looper", avatar_url: "https://www.filepicker.io/api/file/HC5GG5YkR1OTjJ8PFOdo", slug: "the-real-looper"}
])

Blog.create!([
  {owner_id: 1, title: "The End of Time", url: "end-of-time", slug: "end-of-time"},
  {owner_id: 3, title: "Rick and Morty 100 Years", url: "rick-and-morty", slug: "rick-and-morty"},
  {owner_id: 4, title: "Wyld Stallyns!", url: "wyld-stallyns", slug: "wyld-stallyns"},
  {owner_id: 14, title: "Hello, I'm the Doctor", url: "doctorwho", slug: "doctorwho"},
  {owner_id: 10, title: "My Other Car is a Time Machine", url: "eighty-eight-mph", slug: "eighty-eight-mph"},
])

BlogMembership.create!([
  {blog_id: 2, user_id: 5},
  {blog_id: 3, user_id: 6},
  {blog_id: 4, user_id: 17},
  {blog_id: 4, user_id: 9},
  {blog_id: 4, user_id: 11},
  {blog_id: 4, user_id: 15},
  {blog_id: 4, user_id: 18},
  {blog_id: 3, user_id: 7},
  {blog_id: 5, user_id: 12}
])

Following.create!([
  {blog_id: 2, follower_id: 5},
  {blog_id: 2, follower_id: 1},
  {blog_id: 4, follower_id: 1},
  {blog_id: 3, follower_id: 1}
])

Post.create!([
  {author_id: 1, blog_id: 1, title: "I'm posting through time!", body: "Heck yes!"},
  {author_id: 3, blog_id: 2, title: "Rick and Morty Official Blog", body: "And together we're gonna run around, Morty, we're gonna... do all kinds of wonderful things, Morty. Just you and me, Morty. The outside world is our enemy, Morty... we're the only.... friends we've got, Morty! It's just Rick and Morty. Rick and Morty and their adventures, Morty.. RICK AND MORTY FOREVER AND FOREVER A HUNDRED YEARS Rick and Morty.. some...things.. Me and Rick and Morty runnin' around and... Rick and Morty time... a- all day long forever.. all a - a hundred days Rick and Morty! forever a hundred times.... OVER and over Rick and Morty... adventures dot com.. W W W dot at Rick and Morty dot com w..w..w... Rick and Morty adventures.. ah- hundred years..... every minute Rick and Morty dot com.... w w w a hundred times... Rick and Morty dot com.......\""},
  {author_id: 5, blog_id: 2, title: "Uhh, Uncle Rick?", body: "Why do I have such a bad feeling about this?"},
  {author_id: 3, blog_id: 2, title: "Puh-lease", body: "What are you, Morty, like, some sort of coward? We just need to smuggle those seeds right up your butt so security doesn't find them, and then get on that spaceship back home, Morty, and then it'll all be fine, and we can go on even MORE adventures! Won't that be great, Morty?"},
  {author_id: 4, blog_id: 3, title: "Let me introduce myself.", body: "I'm Bill S. Preston, Esquire!"},
  {author_id: 6, blog_id: 3, title: "And I'm Ted Theodore Logan.", body: "And together, we are...\r\n\r\n## WYLD STALLYNS!\r\n\r\n![](https://www.filepicker.io/api/file/cITYg4SnRoWUY4lPdJoa \"enter image title here\")"},
  {author_id: 6, blog_id: 3, title: "But more topically...", body: "We have been having one seriously bodacious time-traveling journey! We even got to meet our future selves. I can't wait until we get to meet the \"princesses\", whoever those are...\r\n\r\nI'm sure this will be an excellent adventure!"},
  {author_id: 14, blog_id: 4, title: "Just a test post.", body: "Just making sure this page works. I would hate to lose touch with everyone back on Gallifrey."},
  {author_id: 18, blog_id: 4, title: "Welllll....", body: "I'm afraid I've got some bad news about that."},
  {author_id: 17, blog_id: 4, title: "He's Right, You Know", body: "Wait, are you me? And is \"allons-y\" your new catch phrase? Please, you can do better."},
  {author_id: 18, blog_id: 4, title: "Yes, well", body: "![enter image description here](https://www.filepicker.io/api/file/vUrYjMtcTTWV5plgaPNw \"enter image title here\")"},
  {author_id: 7, blog_id: 3, title: "Bill and Ted...", body: "I just wanted to say what an honor it is to be traveling with you. I can't believe the amazing things we've seen! No matter what happens...\r\n\r\nParty on, dudes."},
  {author_id: 10, blog_id: 5, title: "It Worked!", body: "So THIS is how this blog got here! Incredible!"},
  {author_id: 12, blog_id: 5, title: "Huh?", body: "Thanks for the invite, Doc, but what are you talking about? What worked?"},
  {author_id: 12, blog_id: 5, title: "Anyone There?", body: "I'm still not sure what's going on, Doc. I'm heading over to talk to you."},
  {author_id: 10, blog_id: 5, title: "Blog site?", body: "What is this thing, Marty? And why do I have an account here? Don't bother me with this foolishness, I have important work to do on the DeLorean!"},
  {author_id: 9, blog_id: 4, title: "To All My Enemies", body: "Now, the question of the hour is: \"Who's got the Pandorica?\"_ Answer:_ I do.\r\n\r\n_Next question_: Who's coming to take it from me?\r\n\r\n...\r\n\r\nCome on! Look at me!\r\n\r\n- No plan\r\n- No back-up\r\n- No weapons worth a damn!\r\n\r\nOh, and something else I don't have: \r\n\r\n- Anything to lose!\r\n\r\nSo, if you're sitting up there in your silly little spaceship with all your silly little guns, and you've got any plans on taking the Pandorica tonight, just remember who's standing in your way! Remember every black day I ever stopped you, and then, and then, do the smart thing: Let somebody else try first.\r\n\r\n![enter image description here](https://www.filepicker.io/api/file/JlOL5bSSCqgNleJeARhV \"enter image title here\")"}
])

Like.create!([
  {user_id: 1, post_id: 11},
  {user_id: 1, post_id: 12},
  {user_id: 1, post_id: 6},
  {user_id: 1, post_id: 2},
  {user_id: 9, post_id: 11},
  {user_id: 9, post_id: 9}
])

Tag.create!([
  {label: "time travel"},
  {label: "awesome"},
  {label: "rick"},
  {label: "morty"},
  {label: "rick and morty"},
  {label: "adventures"},
  {label: "excellent"},
  {label: "air guitar"},
  {label: "time lord"},
  {label: "gallifrey"},
  {label: "sorry"},
  {label: "party on"},
  {label: "great scott"},
  {label: "confused"},
  {label: "pandorica"},
  {label: "geronimo"},
  {label: "not bluffing"}
])

Tagging.create!([
  {post_id: 1, tag_id: 1},
  {post_id: 1, tag_id: 2},
  {post_id: 2, tag_id: 3},
  {post_id: 2, tag_id: 4},
  {post_id: 2, tag_id: 5},
  {post_id: 2, tag_id: 6},
  {post_id: 4, tag_id: 5},
  {post_id: 4, tag_id: 6},
  {post_id: 6, tag_id: 7},
  {post_id: 6, tag_id: 8},
  {post_id: 7, tag_id: 7},
  {post_id: 7, tag_id: 6},
  {post_id: 7, tag_id: 1},
  {post_id: 8, tag_id: 9},
  {post_id: 8, tag_id: 10},
  {post_id: 9, tag_id: 11},
  {post_id: 9, tag_id: 10},
  {post_id: 12, tag_id: 12},
  {post_id: 12, tag_id: 1},
  {post_id: 13, tag_id: 13},
  {post_id: 14, tag_id: 14},
  {post_id: 17, tag_id: 9},
  {post_id: 17, tag_id: 15},
  {post_id: 17, tag_id: 16},
  {post_id: 17, tag_id: 17}
])