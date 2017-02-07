module Doccy

  # A HTTP client for interfacing with the Doccy TFN API.
  class Tfn

    def initialize(base_url, auth_token = nil)
      # Setup Faraday Connection
      @conn = Faraday.new(:url => base_url) do |faraday|
        faraday.request  :multipart
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      if auth_token
        @auth = auth_token
      else 
        authenticate
      end
    end

    # Retrieve Doccy authentication token.
    def authenticate
      response = @conn.post "/api/1/sessions", {email: ENV["DOCCY_USERNAME"], password: ENV["DOCCY_PASSWORD"]}
      body = JSON.parse(response.body,symbolize_names: true)[:response]
      @auth = body[:auth_token]
    end

    # Upload a pdf to the Doccy TFN Remover API.
    def uploadTFN(input_file)
      response = @conn.post "/api/1/tfn_jobs", {auth_token: @auth, input_file: Faraday::UploadIO.new(input_file, 'application/pdf')}
      return JSON.parse(response.body,symbolize_names: true)[:response]
    end

    # Pings Doccy for the status of a document.
    def pingTFN(id)
      response = @conn.get "api/1/tfn_jobs/#{id}", {auth_token: @auth}
      return JSON.parse(response.body, symbolize_names: true)[:response]
    end

    # Downloads a completed document from Doccy, if it exists and the status is processed.
    def downloadTFN(id)
      response = @conn.get "api/1/tfn_jobs/#{id}/download", {auth_token: @auth}
      return response.body
      #File.open('out.pdf', 'w') {|f| f.write(response.body)}
    end

    # Removes images and job from Doccy server
    def removeTFN(id)
      response = @conn.delete "api/1/tfn_jobs/#{id}", {auth_token: @auth}
    end


  end
    
end