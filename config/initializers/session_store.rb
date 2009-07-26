# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bookstore_tdd_session',
  :secret      => '33a753247c2943d9a59a95841a814ba92d7991a49e0b12140298dfa9bc5d076a79ea0ce3df9333578a11126bacfcdc040a86ba7e8db68382ae2394ab2ed3ca1b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
