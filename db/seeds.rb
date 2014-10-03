Blog.create!([
  {owner_id: 1, title: "My First Blog", url: "chrono-blogger", slug: "chrono-blogger"},
  {owner_id: 3, title: "Rick and Morty 100 Years", url: "rick-and-morty", slug: "rick-and-morty"},
  {owner_id: 4, title: "Wild Stallyns!", url: "wild-stallyns", slug: "wild-stallyns"},
  {owner_id: 14, title: "Hello, I'm the Doctor", url: "doctorwho", slug: "doctorwho"},
  {owner_id: 10, title: "My Other Car is a Time Machine", url: "eighty-eight-mph", slug: "eighty-eight-mph"}
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
Like.create!([
  {user_id: 1, post_id: 11},
  {user_id: 1, post_id: 12},
  {user_id: 1, post_id: 6},
  {user_id: 1, post_id: 2},
  {user_id: 9, post_id: 11},
  {user_id: 9, post_id: 9}
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
User.create!([
  {email: "calvin@watterson.com", password_digest: "$2a$10$aCJ2SLnS7VCsFX8Huvs73O5gURmXvrEx97q3cUh1AA3JD0uaSCO5y", session_token: "TqAlnoZ6dTgH_dYUtn064g", username: "spaceman-spiff", avatar_url: "https://www.filepicker.io/api/file/aX0jRYHnQGicFIBKLCkV", slug: "spaceman-spiff"},
  {email: "t2@skynet.gov", password_digest: "$2a$10$5/VcmCsiFrBKwM9OxwayBOb0XJz048OY57aVpWmMP0y3yM4zdaeZC", session_token: "vraPKUfhloN2SVLLx3Kc3w", username: "t-800", avatar_url: "https://www.filepicker.io/api/file/3LP299IWTTeMXnFEdYUh", slug: "t-800"},
  {email: "amy@tardis.com", password_digest: "$2a$10$/3gcFUIk4zXTkSVRL.Jmou6N9VRt2qkbXALcLLfJOero6BqIiNAvS", session_token: "6qweko2ZaRlkTDVquFjEDg", username: "amy-pond", avatar_url: "https://www.filepicker.io/api/file/FskFFwTYT9y7nVivsqRI", slug: "amy-pond"},
  {email: "dalek@dalek.dalek", password_digest: "$2a$10$va8QwMsnlzP9R5o1zzGnGezYcpRmfry929/dp/BuFAMjraQLmwqaa", session_token: "QQAgh8Non4uiNYoavLdAMw", username: "x-terminate", avatar_url: "https://www.filepicker.io/api/file/gknDxKkeQlaIInuDTHkz", slug: "x-terminate"},
  {email: "rory@tardis.com", password_digest: "$2a$10$eubSEyRVK6V/oAsuO3XGr.2cqvvqWCAgle0.cVWXpl14PyVo5vgO2", session_token: "IllP5QK_dVLCPiwbOSrmZw", username: "rory-the-roman", avatar_url: "https://www.filepicker.io/api/file/1uRNIk1VS46ITKz1rOjJ", slug: "rory-the-roman"},
  {email: "winston@downing.gov", password_digest: "$2a$10$JsfYOVEqsaV8gaBvYKkUOu9G8h1TqpvS39DGliZTmRXhzFHzARV/a", session_token: "XNewom6lBbuOIZvVk1Eh9Q", username: "churchill-caesar", avatar_url: "https://www.filepicker.io/api/file/7kNoIGtwT3WxMZIpsSw4", slug: "churchill-caesar"},
  {email: "looper@sonypictures.com", password_digest: "$2a$10$OhI1a7zKyhXcp80yDJGJ1.rjh3IaoUPGvX54SgGiR29LGvjHRHkHe", session_token: "WripVmCRlgbAGM42O7byiQ", username: "looper", avatar_url: "https://www.filepicker.io/api/file/VL3XKVzlSjGGiJ4NPyIq", slug: "looper"},
  {email: "looper2@sonypictures.com", password_digest: "$2a$10$i60lB.cboT3bLSp7xOon3OOjMdDHEEhTc61d5h1SOTbs9RzWeNLw2", session_token: "I8mdoIg101f12aFDwBGoiQ", username: "the-real-looper", avatar_url: "https://www.filepicker.io/api/file/HC5GG5YkR1OTjJ8PFOdo", slug: "the-real-looper"},
  {email: "morty@adultswim.com", password_digest: "$2a$10$XP/jP1EQefsIQm05Mxl3BOKA4ZBX214Z5CZ2qqVOxLW/skAN3fRMW", session_token: "c-5m9oCDqjQK2UPrxq9EAA", username: "mortyfied", avatar_url: "https://www.filepicker.io/api/file/00JZiscISfOTLVAjRxEd", slug: "mortyfied"},
  {email: "rick@adultswim.com", password_digest: "$2a$10$XgRCvATCcDhezXbH0ZH0MuT8luVaUET.fHi3SEVjbKywKzKgXbJxa", session_token: "BMxT0z_j6AIID71Awg1SGA", username: "rickdiculous", avatar_url: "https://www.filepicker.io/api/file/oCxbqJtRJW80KEybnspj", slug: "rickdiculous"},
  {email: "ted@stallyns.net", password_digest: "$2a$10$wWJp9uzDGmPY9q1Co5IWC.JnQ4Pfz8H37geSgOvGmyMp/hFbc/xuW", session_token: "HNFfXOhtXeFzij1EoejYjw", username: "ted-like-whoa", avatar_url: "https://www.filepicker.io/api/file/qMCI8WliRMC2l643RJCD", slug: "ted-like-whoa"},
  {email: "one@gallifrey.net", password_digest: "$2a$10$rCVj5y.Dpoa.FLoSU9vt6.pVF0P0MFuCLv5sVXJN0TrBhEf6Es/Dy", session_token: "qujBP4YtpLOkTt7p8cvZDA", username: "the-good-doctor", avatar_url: "https://www.filepicker.io/api/file/O1xTdHAARCWcEIAmfXFA", slug: "the-good-doctor"},
  {email: "nine@gallifrey.net", password_digest: "$2a$10$EgGXH7pm8ioYAwnVB0LaQ.ChLSao4TQWtfldHutYu3RQQ.tr/Mvq6", session_token: "a2qW-xBi0_4Yhp7uKZ_Zpg", username: "fantastic", avatar_url: "https://www.filepicker.io/api/file/59k0JqU3Qmm3GQIyOKeG", slug: "fantastic"},
  {email: "ten@gallifrey.net", password_digest: "$2a$10$q902qQz4usmNeJs4alPkAONBC45VkWb.ojaa1BtKGsjY3nTxQlHkC", session_token: "pRh00cyG-n_3HXat-CRl1g", username: "allons-y", avatar_url: "https://www.filepicker.io/api/file/UcQuiLUTS7WFGo75rKUD", slug: "allons-y"},
  {email: "bill@stallyns.net", password_digest: "$2a$10$4Wf9uZcyCV1BT7eqvdeuIePDKqjzjEt1L9EUxrKGyn0QZp9BVjbWa", session_token: "3dHiRpG75LeWkfgzb5fcww", username: "bill-esque", avatar_url: "https://www.filepicker.io/api/file/6hj7Fz0mS4uoeGT5ruKN", slug: "bill-esque"},
  {email: "abe@whitehouse.gov", password_digest: "$2a$10$LObcUt8IX1dqiO7X66TjNOsIdJYv3jmQv7XoMTFoyUxQjLUrRJ9lq", session_token: "LKuovZdNZVr61YX2vxIR2g", username: "honest-abe", avatar_url: "https://www.filepicker.io/api/file/u4THIK9uQxOPX9Ke4Qny", slug: "honest-abe"},
  {email: "guest@flux-capacitr.com", password_digest: "$2a$10$JMDBXDoTwQQ/pFwu4fOjE.e/fDlobdQXZxJvByQ4DPHqF0IRG2QmO", session_token: "22u386PNZZbae7dJcg0xxw", username: "timely-guest", avatar_url: "http://www.seilchat.co.uk/download/file.php?avatar=1081_1390414737.gif", slug: "timely-guest"},
  {email: "marty@future.com", password_digest: "$2a$10$1zIITsxl2UNbH1Kytgqfou5usGP1bcj/3jywwOOgkh.jiEaG7rD92", session_token: "eKZppfajq9OHkJxjJN9svw", username: "mcfly-guy", avatar_url: "https://www.filepicker.io/api/file/1dv52xgCR4Cdno2FkTsa", slug: "mcfly-guy"},
  {email: "doc@future.com", password_digest: "$2a$10$iWmWfkz/hWPQeDdG8/OaxuZtckLMplf9w6HFyGxJUQUWCK2vCpl62", session_token: "itLyvaD6cFTdmu5RlM6m9w", username: "great-scott", avatar_url: "https://www.filepicker.io/api/file/U0wo1NzgRGWquG77k7KA", slug: "great-scott"},
  {email: "eleven@gallifrey.net", password_digest: "$2a$10$cP61WssSB4NzL5DFCrbX.uXa1fODB/WDzPGf4m9U2XOirso3i49Re", session_token: "A6vcvpAgikpqu6pkUzaYXA", username: "geronimo", avatar_url: "https://www.filepicker.io/api/file/vsUCvKDlQM2imFNK5awt", slug: "geronimo"}
])
