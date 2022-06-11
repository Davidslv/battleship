# Battleship 🏴‍☠️

[Battleship Game](https://en.wikipedia.org/wiki/Battleship_(game)) Logic

## The Game

The board is 10x10 – and the individual squares on the board are identified by numbers.

The initial phase of this game a player will be guessing where each ship has been positioned.
Essentially you will be playing against the computer.

You will have limited amount of missiles, this means that you lose the game if you run out of missiles.

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

This project was created using ruby 3.0.0 (see [.ruby-version](https://github.com/Davidslv/battleship/blob/main/.ruby-version)).

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

Battleship::Commands::Fire.new(board, 1, 1).call

```

## Game Setup


## Play the Game

To play the game you will provide coordinates separated by space.

```shell
ruby ./lib/battleship.rb
```


### Start application

```shell
irb -r ./lib/battleship.rb
```

### Start a new board

You can see where the ships are positioned by changing the parameter `reveal` to `true`,
by default it is `false`.

```ruby
board = Battleship::Commands::Setup.init(reveal: false)
```

### Fire a missile

Firing a missile has several outcomes:
- You hit water, you will see the `O` character on the board;
- You hit a ship, you will see the `X` character on the board;
- You sink a ship, this will happen when you have found all pieces of the ship;
- You send an invalid coordinate, that will return invalid.

There is metadata as output, this will be used later to fuel the API.

```ruby
Battleship::Commands::Fire.new(board, 1, 1).call
=> {:valid=>true, :water=>true, :hit=>false, :sunk=>false, :name=>"Water"}
Battleship::Commands::Fire.new(board, 11, 15).call
=> {:valid=>false}
Battleship::Commands::Fire.new(board, 5, 5).call
=> {:valid=>true, :water=>false, :hit=>true, :sunk=>false, :name=>"Carrier"}

puts board
```
