#!/usr/bin/ruby

# $Id: activemerchant.rb,v 1.1 2007/08/20 14:53:57 swain Exp $

# example of connecting to the DB with ActiveMerchant in a standalone script.

require "rubygems"
require_gem "activemerchant"

puts "Hello, sailor!"

class PaymentTransactionTest
  require 'money'

  attr_accessor :creditcard

  def initialize
    @creditcard = ActiveMerchant::Billing::CreditCard.new(
                                                          #Authorize.net test card, error-producing
                                                         :number     => '4222222222222',
                                                          #Authorize.net test card, non-error-producing
                                                         # :number   => '4007000000027',
                                                          #for test cards, use any date in the future
                                                         :month      => 3,
                                                         :year       => 2010,              
                                                         :first_name => 'Mark',      
                                                         :last_name  => 'McBride',
                                                          #note that MasterCard is 'master'
                                                         :type       => 'visa'
                                                         )
  end

end

foo = PaymentTransactionTest.new

if foo.creditcard.valid?
  puts "it's a valid credit card number."
end

puts foo.creditcard.last_digits
