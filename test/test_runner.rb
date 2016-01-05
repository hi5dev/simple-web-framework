require 'minitest/autorun'

require_relative '../lib/framework'

Dir[File.expand_path('../**/*_test.rb')].each {|f| load f }
