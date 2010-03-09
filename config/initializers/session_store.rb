# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_LogBook_session',
  :secret      => '8d0a54dfbdd12ce08704b972141196beff09332a6df123eb54fea9822eba2410624fc6beff2d22f10d4b7350fa87b1bfefff283c124337a57c4381785b108001'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
