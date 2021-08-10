# frozen_string_literal: true

class ApplicationPageComponent < ApplicationComponent
  renders_one(:title)
  renders_one(:description)
  renders_one(:body)

  private

  def favicon_meta_tags
    [
      tag("link", rel: "icon", href: "/favicon.ico", sizes: "any"),
      tag("link", rel: "icon", href: "/icon.svg", type: "image/svg+xml"),
      tag("link", rel: "apple-touch-icon", href: "/apple-touch-icon.png", type: "image/svg+xml"),
      tag("link", rel: "manifest", href: "/manifest.webmanifest")
    ].join("\n").html_safe
  end
end
