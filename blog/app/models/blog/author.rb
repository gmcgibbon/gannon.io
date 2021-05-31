# frozen_string_literal: true

module Blog
  class Author < ApplicationModel
    RECORDS = {
      gannon: {
        name: "Gannon McGibbon",
        avatar: "/authors/avatars/me.jpg",
        url: "https://gannon.io/about",
      },
    }.freeze
    private_constant(:RECORDS)

    attributes(:id, :name, :avatar, :url)

    class << self
      def all
        @all ||= RECORDS.map { |id, attributes| Author.new(id: id.to_s, **attributes) }
      end

      def find(id)
        all.find { |record| record.id == id } || raise(
          ApplicationModel::NotFoundError,
          "Couldn't find #{self} with id of \"#{id}\".",
        )
      end
    end
  end
end
