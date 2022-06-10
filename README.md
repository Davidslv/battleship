# Battleship 🏴‍☠️

[Battleship Game](https://en.wikipedia.org/wiki/Battleship_(game)) Logic

## The Game

The board is 10x10 – and the individual squares on the board are identified by numbers.

On one grid the player arranges ships and records the shots by the opponent.
On the other grid, the player records their own shots.


## What is provided

- [RuboCop](https://docs.rubocop.org/rubocop/index.html)
- [RSpec](https://relishapp.com/rspec)
- [Pry](https://github.com/pry/pry)
- [Simplecov](https://github.com/simplecov-ruby/simplecov)
- [Github Workflows](https://docs.github.com/en/actions/using-workflows)

## What you should know

- Your code goes inside the lib folder
- Remember to do your code in small chunks
- Remember to test your code
- Remember clean code and SOLID principles
- Remember to open Pull Requests with your features isolated

## Commands

### Installation

This project was created using ruby 2.7.2 (see .ruby-version).

I use rbenv to install different ruby versions, you may need to install [homebrew](https://brew.sh).

```bash

$ brew install ruby-build rbenv

$ rbenv install

$ gem install bundler

$ bundle install
```

### Testing with rspec

```
$ rspec
```

### Linting with RuboCop

```
$ bundle exec rubocop
```

If you want to correct all cops

```
$ bundle exec rubocop -A
```

### Test coverage

After running the rspec command, a new directory is created to show test coverage

```
$ open coverage/index.html
```


## Setup Script

This is a playground script to verify next steps.

```ruby

board = Battleship::Commands::Setup.init
puts board
```

### Output Examples

```ruby

  0 1 2 3 4 5 6 7 8 9
0 ~ ~ ~ ~ ~ ~ ~ B ~ ~
1 ~ S S S ~ P P B ~ ~
2 ~ ~ ~ ~ ~ ~ ~ B ~ ~
3 ~ ~ ~ ~ ~ ~ ~ B ~ ~
4 ~ ~ ~ D ~ ~ ~ ~ ~ ~
5 ~ ~ ~ D ~ ~ ~ ~ ~ ~
6 ~ ~ ~ D ~ ~ ~ ~ ~ ~
7 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
8 ~ ~ ~ ~ C C C C C ~
9 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
```

```ruby
  0 1 2 3 4 5 6 7 8 9
0 ~ ~ ~ ~ ~ ~ ~ S ~ ~
1 ~ C ~ ~ ~ ~ ~ S ~ ~
2 ~ C ~ ~ ~ ~ ~ S ~ ~
3 ~ C ~ ~ ~ ~ ~ ~ ~ ~
4 ~ C ~ ~ ~ ~ B ~ ~ D
5 ~ C ~ ~ ~ ~ B ~ ~ D
6 ~ ~ ~ ~ ~ ~ B ~ ~ D
7 ~ ~ ~ ~ ~ ~ B ~ ~ ~
8 ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
9 ~ ~ ~ P P ~ ~ ~ ~ ~
```
