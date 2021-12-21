# frozen_string_literal: true

module Blog
  module ApplicationHelper
    def datte(date)
      date.to_fs(:long)
    end
  end
end
