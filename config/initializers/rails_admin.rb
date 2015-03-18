RailsAdmin.config do |config|

  config.main_app_name = ['Gannon.io', 'Administration']

  config.authenticate_with do
    authenticate_user!
  end

  config.authorize_with :cancan

  config.current_user_method(&:current_user)

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

# RailsAdmin enum support: https://gist.github.com/dmilisic/38fcd407044ace7514df
module ActiveRecord
  module RailsAdminEnum
    def enum(definitions)
      super

      definitions.each do |name, values|
        define_method("#{name}_enum") do
          self.class.send(name.to_s.pluralize).to_a
        end

        define_method("#{name}=") do |value|
          if value.kind_of?(String) && value.to_i.to_s == value
            super value.to_i
          else
            super value
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send(:extend, ActiveRecord::RailsAdminEnum)
