require 'logger'

module Doccy
  
  autoload :Accounts,           "doccy/accounts"
  autoload :Templates,          "doccy/templates"
  autoload :Documents,          "doccy/documents"
  autoload :Emails,             "doccy/emails"
  autoload :Session,            "doccy/session"
  autoload :Config,             "doccy/config"
  autoload :Tfn,                "doccy/tfn"
  autoload :VERSION,            "doccy/version"

   
  def self.logger
    @logger ||= Logger.new(STDOUT).tap { |logger| logger.level = Logger::INFO }
  end 
  
end