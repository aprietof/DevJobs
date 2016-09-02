# DevJobs

This is a ruby on Rails v5.0 job board web application that includes signup, login, logout and third party facebook signup/login.

###Uses ActiveRecord Model Associations between:

- User
- Job
- Job Application
- Category
- Skill

This App offers the following characteristics depending on user role:

##Roles:

###Company:
- Can Post Job offers (Jobs)
- Can Edit, update and delete its own job offers
- Can't apply to jobs

###User
- Can apply to jobs
- Can't post any jobs
- Can see its own job applications
- Can't see anyone else's job applications

###Admin.

Can manipulate app data.

## Usage

To use this app, just clone, run `bundle install`, `rake db:migrate`, then run `rails s`.

Everything should be set up.

## Contributing Bugfixes or Features

For submitting something back, be it a patch, some documentation, or new feature requires some level of
community interactions.

Committing code is easy:

- Fork the this repository
- Create a local development branch for the bugfix; I recommend naming the branch such that you'll
  recognize its purpose.
- Commit a change, and push your local branch to your github fork
- Send me pull request for your changes to be included

I apologize in advance for the slow action on pull requests and issues.

## License
DevJobs is licensed under the MIT license. (http://opensource.org/licenses/MIT)
