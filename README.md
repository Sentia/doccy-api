# Doccy::Api
Official Ruby wrapper for the https://www.doccyapp.com api

## Installation

Add this line to your application's Gemfile:

    gem 'doccy-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doccy-api
	
## Usage

Create a doccy_api.rb file in your config/initializers folder and add the following

	Doccy::Config.mode = :production" # OPTIONAL defaults to staging.
	Doccy::Config.app_key = "YOUR-PARTNER-KEY" #OPTIONAL you only need this to create client accounts.


## Sections


* [Accounts](#accounts)
* [Templates](#templates)
* [Documents](#documents)
* [Emails](#emails)
* [Login](#login)


## <a name="accounts"> Accounts</a>

Doccy Partners are able to create client accounts through their applications. To become a partner contact us at support@doccyapp.com for more information.

Create an account and a user:
  
	Doccy::Accounts.create(company_name, user_name, email, password, options = {})
  

## <a name="templates"> Templates </a>

Returns all Templates for that users account

    Doccy::Templates.all(auth_token)
    
   
Returns a specific Template
    
    Doccy::Templates.get(auth_token, template_id)


Uploads a Teamplate to Doccy

- Method: `post`
- Request Params:
  - template[name]: Name of template in Doccy * Required
  - template[description]: Optional
  - template[document_template]: Template file to upload * Required
  
- Request Example: no request content
 
    Doccy::Templates.upload(auth_token, template_params)


## <a name="documents"> Documents </a>

Creates a Document from Template

- Method: `post`
- Request Params:
  - document[name]: Name of document * Required
  - document[content][:placeholder]: Placeholde should be replaced by the values returned from template show action

  Doccy::Documents.create(auth_token, template_id, document_params)
  
    
Returns a specific Document
  
    Doccy::Documents.get(auth_token, template_id, document_id)


Downloads a Document
    
    Doccy::Documents.download(auth_token, template_id, document_id)


## <a name="emails"> Emails </a>

Will send a document via Doccy

	Doccy::Documents.create(auth_token, template_id, document_id, email_params)

## <a name="login"> Login </a>

This will return the auth_token for that user.

	Doccy::Session.create(email, password)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
