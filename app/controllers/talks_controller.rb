# typed: true
# frozen_string_literal: true

class TalksController < ApplicationController
  def index
    @talks = Talk.all
  end
end
