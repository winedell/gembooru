class Artist < ApplicationRecord
  extend Memorist
  class RevertError < StandardError; end

  attr_accessor :url_string_changed

  deletable
  
  module UrlMethods
    extend ActiveSupport::Concern
  end
end