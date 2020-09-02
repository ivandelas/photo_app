<!-- place all the badges here -->
![release badge](https://img.shields.io/github/v/release/santiago-rodrig/photo-app)
![website state badge](https://img.shields.io/website?down_color=lightgrey&down_message=offline&up_color=green&up_message=online&url=https%3A%2F%2Fsrodrig-photo-app.herokuapp.com)
![license badge](https://img.shields.io/github/license/santiago-rodrig/photo-app)
![followers](https://img.shields.io/github/followers/santiago-rodrig?style=social)
![stars](https://img.shields.io/github/stars/santiago-rodrig/photo-app?style=social)

# Project title

[live version](https://srodrig-photo-app.herokuapp.com)

This project is part of the [The Complete Ruby on Rails Developer Course](https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course/)
and it is about uploading pictures and making payments for subscription plans. The idea is this, to register you need to choose a
subscription plan and then provide the user details together with the credit card details, [Stripe](https://stripe.com/) was used to process
the payments so you can search their documentation to get some test credit card details.

## Table of contents

- [Requirements](https://github.com/santiago-rodrig/photo-app#requirements)
- [Setup](https://github.com/santiago-rodrig/photo-app#setup)
- [Collaboration](https://github.com/santiago-rodrig/photo-app#collaboration)
- [License](https://github.com/santiago-rodrig/photo-app#license)
- [Contact](https://github.com/santiago-rodrig/photo-app#contact)

## Requirements

- [Ruby](https://www.ruby-lang.org/en/) (~> 2.6.6)
- [Bundler](https://bundler.io/v2.1/#getting-started) (2.1.4)
- [SQLite3](https://www.sqlite.org/index.html) (~> 3.28.0)

## Setup

First, clone this repository.

```sh
git clone https://github.com/santiago-rodrig/photo-app.git
```

Install the required dependencies.

```sh
bundle && yarn install --check-files
```

Run the database migrations.

```sh
rails db:migrate
```

Start the local web server.

```sh
rails s
```

Visit [localhost at port 3000](http://localhost:3000) and see the app runnning.

## Collaboration

To collaborate to this project first fork the repository, after that, create a new branch based
on [develop](https://github.com/santiago-rodrig/photo-app/tree/develop)
(using [Git-flow](https://nvie.com/posts/a-successful-git-branching-model/)
is recommended), push your branch to your forked repository and create a PR (Pull Request)
from your branch to the develop branch of the original repository.

## License

Specify the license. You can [read the license here](LICENSE).

## Contact

You can reach out to me through the following URLs.

- [My website](https://santiagorodriguez.dev)
- [Github](https://github.com/santiago-rodrig)
- [LinkedIn](https://www.linkedin.com/in/santiago-andres-rodriguez-marquez/)
- [AngelList](https://angel.co/u/santiago-andres-rodriguez-marquez)
- [santo1996.29@gmail.com](mailto:santo1996.29@gmail.com)
