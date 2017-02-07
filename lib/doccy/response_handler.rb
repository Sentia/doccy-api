module Doccy
  class ResponseHandler

    def initialize response
      @response = response
    end

    def success?
      @response.success?
    end

    def status
      @response.status
    end

    def headers
      @response.response_headers
    end

    def raw_body
      @response.body
    end

    def body
      ::JSON.parse(@response.body, symbolize_names: true)
    end

    def data
      body.fetch(:response, {})
    end

    def error
      success? ? {} : data
    end

    def error_type
      error.fetch(:error, "")
    end

    def error_description
      error.fetch(:error_description, "")
    end
  end
end