# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_freelance_session',
  :secret      => 'e0aab65b3ba5d6dbc7c43af31194c6ae3d3272625e95912b43354473a0d0eee91637a315444f06e988d40ae948ef49b22816f406e4f77d06b7f1480331572fbd'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
