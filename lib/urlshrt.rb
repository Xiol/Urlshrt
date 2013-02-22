require 'urlshrt/version'
require 'urlshrt/db'
require 'redis'
require 'digest/sha2'

SALT="NXALCEayZKS2LDpLNnH77C0ZBYZk71WDGcUOt+jzsbo="

module Urlshrt
  class Shrtnr
    def initialize(args = {})
      @redis = nil
      if args[:redis_sock_path]
        @redis = Redis.new(:path => args[:redis_sock_path])
      else
        @redis = Redis.new(
          :host => args[:redis_host] || '127.0.0.1',
          :port => args[:redis_port] || '6379'
        )
      end
      @baseurl = args[:baseurl] || 'http://l.rig.gr'
    end

    def add_url(url)
      hash = Digest::SHA256.hexdigest("#{url}#{SALT}")

      url = get_shorturl_by_hash(hash)
      return url if url

      shorturl = make_shorturl(url, hash)
      
      u = Url.create(
        :created => Time.now,
        :urlhash => hash,
        :url => url,
        :shorturl => shorturl,
        :hits => 0
      )

    shorturl
    end

    def make_shorturl(url, hash)
      last = @redis.get('last')
      if last.nil? 
        @redis.set('last', 'a')
        return "#{@baseurl}/a#{hash[4..5]}"
      end
      @redis.set('last', last.next)
      "#{@baseurl}/#{last.next}#{hash[4..5]}"
    end

    def get_shorturl_by_hash(hash)
      surl = Url.first(:urlhash => hash)
      if surl.nil?
        false
      else
        incr_hit(hash)
        surl[:shorturl]
      end
    end

    def get_shorturl(url)
      get_shorturl_by_hash(Digest::SHA256.hexdigest("#{url}#{SALT}"))
    end

    def incr_hit(hash)
      url = Url.first(:urlhash => hash)
      url.update(:hits => (url[:hits] + 1))
    end
  end
end
