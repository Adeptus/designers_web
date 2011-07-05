# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_designe_session',
  :secret      => 'b8d634187c276171c822ecb023a311e5ea53698d7c1903e0b74d9f7fa83398e6e55298c73c94172a7058db5bc1063bd24559a5dd25df39b21b0012b5544bf2fe'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
