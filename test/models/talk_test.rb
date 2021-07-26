# frozen_string_literal: true

require "test_helper"

class TalkTest < ActiveSupport::TestCase
  test ".all loads all authors" do
    assert_equal(
      [
        Talk.new(
          id: "railsconf_2021",
          title: "Profiling to make your Rails app faster",
          description: <<~DESCRIPTION.squish,
            As you grow your Rails app, is it starting to slow down?
            Let’s talk about how to identify slow code, speed it up, and verify positive change within your application.
            In this talk, you’ll learn about rack-mini-profiler, benchmark/ips, and performance optimization best practices.
          DESCRIPTION
          url: "https://www.youtube.com/watch?v=AFpq1pDQagw",
        )
      ],
      Talk.all,
    )
  end

  test ".all is memoized" do
    assert_same(Talk.all, Talk.all)
  end

  test "#conference" do
    assert_instance_of("Some Conference 444", Author.new(id: "some_conference_444"))
  end
end
