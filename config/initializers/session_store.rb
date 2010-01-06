# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_violinet_session',
  :secret      => '7976e32766ec4e7c12fb1e114b81529100f96b7a49a7d203dae46037a9a8a89b9c36fc75a865c0f8eab7da04a3b855b3e2c061c8b87335af5eee192ef548845e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
