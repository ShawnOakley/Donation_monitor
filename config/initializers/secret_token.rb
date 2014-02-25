# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
DonorRegistry::Application.config.secret_key_base = 'b0c43378c778ef85df73465702ffb8806c664dc8a8a6abbbc3f6757c55d1aa4d380bf01fe818d322530cdc1f1e0189ac24d74fb2298d10bd373ba25fb270c008'
