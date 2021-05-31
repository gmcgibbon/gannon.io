# frozen_string_literal: true

require "test_helper"

module Blog
  class DocumentRendererTest < ActiveSupport::TestCase
    test ".render renders erb" do
      document = DocumentRenderer.render(
        erb_document,
        extensions: %w(erb),
        context: list_context(title: "Grocery", items: %w(apples oranges bananas)),
      )

      assert_equal(<<~HTML, document)
        <h1>Heading</h1>

        <p>Grocery list</p>
        <ul>

          <li><p>apples</p></li>

          <li><p>oranges</p></li>

          <li><p>bananas</p></li>

        </ul>
      HTML
    end

    test ".render renders md" do
      document = DocumentRenderer.render(
        md_document, extensions: %w(md), context: nil,
      )

      assert_equal(<<~HTML, document)
        <h1 id="heading">Heading</h1>

        <p>Grocery list</p>

        <ul>
          <li>apples</li>
          <li>oranges</li>
          <li>bananas</li>
        </ul>
      HTML
    end

    test ".render renders mixed" do
      document = DocumentRenderer.render(
        mixed_document,
        extensions: %w(erb md),
        context: list_context(title: "Grocery", items: %w(apples oranges bananas)),
      )

      assert_equal(<<~HTML, document)
        <h1 id="heading">Heading</h1>

        <p>Grocery list</p>

        <ul>
          <li>
            <p>apples</p>
          </li>
          <li>
            <p>oranges</p>
          </li>
          <li>
            <p>bananas</p>
          </li>
        </ul>

      HTML
    end

    private

    def list_context(title:, items:)
      Struct.new(:title, :items).new(title, items)
    end

    def erb_document
      <<~ERB
        <h1>Heading</h1>

        <p><%= title %> list</p>
        <ul>
        <% items.each do |item| %>
          <li><p><%= item %></p></li>
        <% end %>
        </ul>
      ERB
    end

    def md_document
      <<~MD
        # Heading

        Grocery list

        - apples
        - oranges
        - bananas
      MD
    end

    def mixed_document
      <<~ERB
        # Heading

        <%= title %> list
        <% items.each do |item| %>
          - <%= item %>
        <% end %>
      ERB
    end
  end
end
