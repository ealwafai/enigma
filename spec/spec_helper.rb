require 'rspec'
require 'simplecov'
SimpleCov.start
SimpleCov.add_filter ['spec']
require './lib/key'
require './lib/offset'
require './lib/encryption'
require './lib/decryption'
require './lib/enigma'
