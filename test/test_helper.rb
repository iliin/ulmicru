if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

require 'simplecov'
ENV['RAILS_ENV'] = 'test'
SimpleCov.start('rails') if ENV['COVERAGE']

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'webmock/minitest'

FactoryGirl.reload

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include Concerns::AuthManagment
  include ModelsConcern
  include Concerns::TechinalPagesManagment

  def load_fixture(filename)
    template = ERB.new(File.read(File.dirname(__FILE__) + '/fixtures/#{filename}'), nil, '%')
    template.result
  end
end
