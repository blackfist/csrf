# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Csrf::Application.config.secret_key_base = 'f5ae66e0a62e8a597ab7a49ed384c28cbe582b877fd17ef0319240793cdb3fe5048c21d406ccaaa5e5f01d5470880b5be0b2664c86bec2ced54886f44d879a0f'
