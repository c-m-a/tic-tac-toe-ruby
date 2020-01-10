# frozen_string_literal: true

class Player
  attr_accessor :name
  attr_reader :token

  def initialize(name = nil, token = nil)
    @name = name
    @token = token
  end
end
