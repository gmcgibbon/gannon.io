# frozen_string_literal: true

class Talk
  include ActiveModel::Model

  class NotFoundError < StandardError
  end

  RECORDS = {
    railsconf2021: {
      title: "Profiling to make your Rails app faster",
      description: <<~DESCRIPTION.squish,
        As you grow your Rails app, is it starting to slow down?
        Let’s talk about how to identify slow code, speed it up, and verify positive change within your application.
        In this talk, you’ll learn about rack-mini-profiler, benchmark/ips, and performance optimization best practices.
      DESCRIPTION
      url: "https://www.youtube.com/watch?v=AFpq1pDQagw",
    },
  }.freeze
  private_constant(:RECORDS)

  attr_accessor(:id, :title, :description, :url)

  class << self
    def all
      @all ||= RECORDS.map { |id, attributes| Talk.new(id: id.to_s, **attributes) }
    end
  end
end
