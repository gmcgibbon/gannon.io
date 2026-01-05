# frozen_string_literal: true

class TalksController < ApplicationController
  def index
    @talks = Talk.latest
  end
end
