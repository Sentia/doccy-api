module Doccy
    
  class Documents
    
    def self.create(auth_token, template_id, document_params)
      options = { query: { auth_token: auth_token, document: document_params} }
    
      response = HTTParty.post("#{Doccy::Config.url}/templates/#{template_id}/documents.json", options)
    end
    
    def self.get(auth_token, template_id, document_id)
      options = { query: { auth_token: auth_token} }
    
      response = HTTParty.get("#{Doccy::Config.url}/templates/#{template_id}/documents/#{document_id}.json", options)
    end
    
    def self.download(auth_token, template_id, document_id, original=nil)
      if original
        options = { query: { auth_token: auth_token, original: true} }
      else
        options = { query: { auth_token: auth_token} }
      end
    
      response = HTTParty.get("#{Doccy::Config.url}/templates/#{template_id}/documents/#{document_id}/download.json", options)
    end
    
  end
    
end