#!/usr/bin/env ruby

require 'jwt'
include JWT


rms_token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjBjODY3ZTczNGFmODYzMjMyMGEyMzA5NjE4YWM4NzhhIiwidHlwIjoiSldUIn0.eyJuYmYiOjE1NTUwMTk3NTAsImV4cCI6MTU1NTAyMDA1MCwiaXNzIjoiaHR0cHM6Ly9kaWxpZ2VudC5jb20iLCJhdWQiOiJyZXN0X21lZXRpbmdfc2VydmljZSIsInN1YiI6IjdKR01yNVE5eG1ITElEL2tDMEs5bTJIb2xQWkFJR3hldG9jM08wVkZSdVU9IiwiYXV0aF9zaXRlIjoiSnVyZ2FSZWdyMiIsImp0aSI6ImM1Y2IxZDNkLWZiZDMtNDRhOS04NTk3LThlZTE3MWU4NTgwYyIsInNjb3BlIjpbInJlc3RfbWVldGluZ19zZXJ2aWNlLmZ1bGxfYWNjZXNzIl0sImlhdCI6MTU1NTAxOTc1MH0.X-gDWTQe8Dxuk-oQjV9Mob6Wdn6Ixrwxx51lpLFuDfQfSQ2EpbaHibcT6DqHAt_3izBHmIrGF80U0s7JQt2IHqPFFyLsylJQzFKzdQK4RqbIwjmTymBznUJc6Wr_SadtxXkr4WD1tBwPLBXYMARVzt-FCGKa0ZxoFFR2bnNsJLQRQCjrD_zMFHYvRB50BERANKx3QrwUQR3YTdVi0tJc7d6Sl7DcFa8EslCtzgVzlT_AGn3hEv4vZuu4jdUs7V2IvvEXlN2ebpkTy6r00fZzGlsrfdfU22B3wHTiqXo_U1zvZ01eJD06h9wO0moaCB-bG6BLpv-uGVJbvcFBjjjWjA'

module Hoo
  module Blee
    class Foo
      def self.rms_token_expired?(rms_token)
        contents = JWT.decode(rms_token, nil, false)
        puts contents
        if contents[0]['exp'] < Time.now.to_i
          return true
        else
          return false
        end
      end

      def self.rms_token_from_cache(rms_token)
        if Foo.rms_token_expired?(rms_token)
          puts "Yes it's expired"
        else
          puts "Nope, not expired"
        end
      end
    end
  end
end

Hoo::Blee::Foo.rms_token_from_cache rms_token
