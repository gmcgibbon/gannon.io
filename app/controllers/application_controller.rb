# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def self.method_added(action_name)
    super
    caches_action(action_name, expires_in: 1.week)
  end

  def index; end
end
