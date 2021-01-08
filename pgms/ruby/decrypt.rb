#!/usr/bin/env ruby

require 'openssl'
require 'base64'

private_key_file = 'private.pem';
password = '112233'

encrypted_string = File.read("message")

private_key =
OpenSSL::PKey::RSA.new(File.read(private_key_file),password)

string = private_key.private_decrypt(Base64.decode64(encrypted_string))

print string, "\n"
