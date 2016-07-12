# Terminal Navigation Commands

```ruby
pwd # - print working directory, ex: /Users/Joseph

cd # - change directory

cd # code/ridereminder # this tab autocompletes!

ls # - lists stuff
```

# Database Stuff

```ruby
bundle exec rake db:create

bundle exec rake db:migrate
```

# Rails Stuff

To start your rails app, in the root directory of your app, run:

`rails s`

To access your app, go to: `localhost:3000`

To close out of it, go to your tab in the terminal and hit `control + c`

# Git Stuff

`git status` will show you the status of any modified files since the
last time you committed

red - not "staged for commit"
green - "staged for commit"

`git add filename` will add a file to be "staged for commit", aka,
you're saying you want to bundle this change either by itself or with
other changes to build a commit

**Commit** is just a before and after of text, or a "Delta"

`git commit -m "Useful, descriptive message saying what your changes
consist of"` will take all your "staged for commit" changes and then
turn it into an actual commit that can be transported to other computers

`git push` will sync GitHub with your local machine. Either nothing will
happen, Github will get your commits, or Github will say "whoa -
something else has changed that you need to look at before you can send
your commits up because they conflict with each other"

`git pull` will sync your local machine with github (always type this at
the start of a given coding session so you have the latest updates)


Advanced stuff: we will go over this when the time is right

`git checkout -b branch_name`

`git fetch -p`
