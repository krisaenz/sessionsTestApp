# Cors gives me ability to whitelist certain domains
# we need to be able to use credentials - create rules for communitating with client
# Basically, we are setting up rules that will intercept with requests made by other applications.
# We don't want applications that aren't whitelisted here, to have access to our system.

Rails.application.config.middleware.insert_before 0, Rack::Cors do

    # Allow our react client to access our server
    allow do
        origins "http://localhost:3001"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
    end

    # # Placeholder for prod app. This will be when my client is hosted somewhere (ex: heroku)
    # allow do
    #     origins "https://brikitcloud.net"
    #     resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], 
    #     credentials: true
    # end
end
