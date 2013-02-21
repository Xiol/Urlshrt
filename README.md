# Urlshrt

A gem for creating short URLs. Requires Postgres and Redis.

I'm a Ruby noob and this is my first Gem. Using this in production is stupid. The use of Redis is pointless (for now).

## Installation

Add this line to your application's Gemfile:

    gem 'urlshrt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install urlshrt

## Usage

    > s = Urlshrt::Shrtnr.new()
    => #<Urlshrt::Shrtnr:0x000000009dc330>
    > s.add_url("http://www.google.com")
    => "http://l.rig.gr/ewya3"
    s.get_shorturl("http://www.google.com")
    => "http://l.rig.gr/ewya3"
