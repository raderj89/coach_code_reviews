# Coach Code Reviews App

Built for Dev Bootcamp students

http://dbc-code-reviews.herokuapp.com

A super simple app that allows DBC students to enter URLs for pull requests they want reviewed.

Coaches simply enter their name and update the status of the code review to active. When finished, simply select finished and hit update.

- Yellow-highlighted requests mean no one is on the request.
- Blue-highlighting means a coach is actively reviewing the request.
- Green means they have finished reviewing the request.

## Installation

- Clone this repository
- Run `bundle install`
- Run `rake db:create && rake db:schema:load`

## Contributing

- Make a fork of this repository
- Clone your fork to your machine
- Add this fork as remote upstream: `git remote add upstream https://github.com/raderj89/coach_code_reviews.git`
- Check out a branch
  - New features: `feature/your-new-feature`
  - Refactoring: `chore/your-refactoring`
  - Bugs: `bug/the-bug`
- Push to your branch
- Make a pull request to this repository

### TODO:

Put this explainer in the app.
