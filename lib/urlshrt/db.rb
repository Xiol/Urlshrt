require 'rubygems'
require 'data_mapper'

module Urlshrt
  DataMapper.setup(:default, 'postgres://urlshrtuser:Bluem00n!@localhost/urlshrt')

  class Url
    include DataMapper::Resource

    property :id,         Serial
    property :created,    DateTime
    property :urlhash,    String, :index => true, :length => 64
    property :url,        Text
    property :shorturl,   String
    property :hits,       Integer
  end

  DataMapper.auto_upgrade!
end
