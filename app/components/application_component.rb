# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  delegate(:main_app, to: :view_context)
  delegate(:content_security_policy?, to: :view_context)
end
