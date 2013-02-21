# Urlshrt

A gem for creating short URLs. Requires Postgres and Redis.

## Installation

Add this line to your application's Gemfile:

    gem 'urlshrt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install urlshrt

## Usage

    s = Urlshrt::Shrtnr.new()
    s.add_url("http://www.google.com")
    s.get_shorturl("http://www.google.com")
