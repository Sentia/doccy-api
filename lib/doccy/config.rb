module Doccy
  module Config
    
    class << self
      attr_accessor :endpoints
      attr_accessor :prefix
      attr_accessor :partner_key
      attr_accessor :app_secret
      attr_accessor :mode
    end
    
    self.endpoints = {
      :development  => "http://localhost:3000",
      :staging      => "http://staging.doccyapp.com",
      :production   => "https://www.doccyapp.com"
    }
  
    self.prefix      = "/1"
    self.partner_key = nil
    self.app_secret  = nil
    self.mode        = :staging
    
    def self.url
      if self.mode == :production
        [self.endpoints[:production], "/api", self.prefix, ].join
      elsif self.mode == :development
        [self.endpoints[:development], "/api", self.prefix, ].join
      else
        [self.endpoints[:staging], "/api", self.prefix, ].join
      end
    end
    
  end
end