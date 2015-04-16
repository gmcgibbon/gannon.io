module ViewHelper

  # Determine if current controller does not exist
  # in controllers folder (loaded from a gem)
  def external_controller?
    Dir[Rails.root.join('app', 'controllers', '*_controller.rb')]
      .map   { |f| File.basename(f) }
      .none? { |f| f.starts_with? controller_name }
  end

end
