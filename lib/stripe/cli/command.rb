require 'parseconfig'

module Stripe
  module CLI
    class Command < Thor
      class_option :key, :aliases => :k
      class_option :env, :aliases => :e
      class_option :version, :aliases => :v
      protected

      def api_key
        @api_key ||= options[:key] || stored_api_option('key')
      end

      def api_version
        @api_version ||= options.delete(:version) || stored_api_option('version')
      end

      def environment
        @env ||= options.delete(:env) || config['default']
      end

      def stored_api_option option
        if File.exists?(config_file)
          if environment
            config[environment][option.to_s]
          else
            config[option.to_s]
          end
        end
      end

      def config
        ParseConfig.new(config_file) if File.exists?(config_file)
      end

      def config_file
        File.expand_path('~/.stripecli')
      end

      def list(klass, options)
        execute klass.all(options, api_key)
      end

      def find(klass, id)
        execute klass.retrieve(id, api_key)
      end

      def delete(klass, id)
        execute klass.new(id, api_key).delete
      end

			def create klass, options
				execute klass.create( options, api_key )
			end

			def method_missing name, *args, &block
				klass = args.shift
				define_singleton_method name do
					execute klass.new( *args ).send( name )
				end
			end

		private

			def execute operation
				Stripe.api_version = api_version unless api_version.nil?
				output operation
			end

      def output(objects)
        ap(
          inspect(objects),
          :indent => -2
        )
      end

      def inspect(object)
        case object
        when Array
          object.map {|o| inspect(o) }
        when Hash
          object.inject({}) do |hash, (key, value)|
            hash[key] = inspect(value)
            hash
          end
        when Stripe::ListObject
          inspect object.data
        when Stripe::StripeObject
          inspect object.to_hash
        else
          object
        end
      end
    end
  end
end