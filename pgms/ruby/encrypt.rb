#!/usr/bin/env ruby

# from:
# http://stuff-things.net/2007/06/11/encrypting-sensitive-data-with-ruby-on-rails/

require 'openssl'
require 'base64'

public_key_file = 'public.pem';
string = 'Hello World!';

public_key =
OpenSSL::PKey::RSA.new(File.read(public_key_file))
encrypted_string =
Base64.encode64(public_key.public_encrypt(string))

print encrypted_string, "\n"



# % openssl genrsa -des3 -out private.pem 2048
# Generating RSA private key, 2048 bit long modulus
# ......+++
# .+++
# e is 65537 (0x10001)
# Enter pass phrase for private.pem:
# Verifying - Enter pass phrase for private.pem:

# Then we extract the public key:


# openssl rsa -in private.pem -out public.pem -outform PEM -pubout
# Enter pass phrase for private.pem:
# writing RSA key

