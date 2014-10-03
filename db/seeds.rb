User.create!([
  {email: "guest@flux-capacitr.com", password: "welcome", username: "timely-guest", avatar_url: "http://www.seilchat.co.uk/download/file.php?avatar=1081_1390414737.gif", slug: "a-timely-guest"},
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
  {owner_id: 1, title: "My First Blog", url: "chrono-blogger", slug: "chrono-blogger"}
])

Post.create!([
  {author_id: 1, blog_id: 1, title: "I'm posting through time!", body: "Heck yes!"}
])

Tag.create!([
  {label: "time travel"},
  {label: "awesome"}
])

Tagging.create!([
  {post_id: 1, tag_id: 1},
  {post_id: 1, tag_id: 2}
])