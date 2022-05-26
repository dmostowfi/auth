# to encrypt a secret, use BCrypt::Password.create(secret)
# to test a secret, use BCrypt::Password.new(encrypted) == secret
# run this file using rails runner scripts/encryption.rb

# TODO:
# 1. encrypt a secret and puts encrypted string

secret = "tacos"
encrypted_secret = BCrypt::Password.create(secret)

puts encrypted_secret

# 2. decrypt the encrypted string (how we check encrypted against decrypted)

decrypted_secret = BCrypt::Password.new(encrypted_secret)
puts decrypted_secret #this doesn't input tacos. it's simply there to do the comparison to the encrypted

# 3. check if decrypted value matches secret

puts "is the password tacos?"
puts decrypted_secret == "tacos"

puts "is the password dogs?"
puts decrypted_secret == "dogs"