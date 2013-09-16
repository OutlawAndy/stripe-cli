module Stripe
  module CLI
    module Commands
      class Config < Command
        desc "set VAR VALUE [--group=GROUP]", "write a config variable to ~/.stripecli, optionaly for a specific group"
        def set var, value
          if options[:env]
            config.add_to_group options[:env], var, value
          else
            config.add var.to_s, value.to_s
          end

          File.open(config_file,"w+") do |f|
            config.write f
          end
        end

        desc "get VAR", "get the value of a config variable, defaults to `default` group"
        def get var
          output stored_api_option( var.to_s ) || config[var]
        end
      end
    end
  end
end
# case value
# when Array
#   config.add_to_group option, value[0], value[1]
# else
# end
