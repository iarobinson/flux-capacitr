# Flux-capacitr
I built Flux-capacitr as my final project during the August 2014 cohort of App
Academy. It is a clone of Tumblr built in Ruby on Rails and Backbone.js.

[Live demo!][demo-link]

[demo-link]: http://flux-capacitr.com

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Features

### User Authentication
Passwords are hashed using BCrypt; plaintext passwords are never persisted to
the database. A user is considered "signed in" if the session token stored in
the cookie matches the one stored in the database. This token is reset upon sign
in/sign out.

### JSON API
CRUD of blogs and posts is mediated through a RESTful API. User privileges are
enforced at the controller level to prevent unauthorized creation, update, and
destruction.

### Markdown Formatting
Bootstrap Markdown is integrated into the New/Edit Post forms, providing a
user-friendly way to input and preview posts. Markdown.js is used to parse and
escape post content into HTML in the Show view.

### Image Upload
Users can upload avatars or inline images through a modal view provided by the
Filepicker widget.

### Searching and Filtering
Users can search for blogs and posts through a unified search toolbar. It is
also possible to select one or more tags to filter a collection of posts. The
filtering occurs in real time, with no need to request additional data from the
server until the end of the page is reached.
