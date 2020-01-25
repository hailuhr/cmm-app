# CMD App

## Install

### Clone the repository

```shell
git clone git@github.com:hailuhr/cmd-app.git
cd project
```

### Check Ruby version

```terminal
ruby -v
```

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv):

```terminal
rbenv install 2.6.5p114
```

### Install dependencies

Use [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```terminal
bundle && yarn
```

### Set environment variables

### Initialize the database

```terminal
rails db:create db:migrate db:seed
```

## Serve

```terminal
rails s
```

visit http://localhost:3000/
