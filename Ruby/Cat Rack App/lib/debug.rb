#!/usr/bin/env ruby

# adds debug annotations and methods

# frozen_string_literals: true
# typed: strong

module Debug
  extend T::Sig

  DEBUG_KEY = T.let('CAT_RACK_APP_DEBUG', String)
  DEBUG_VALS = T.let(%w[1 yes y true].freeze, T::Array[String])

  IS_DEBUG = T.let(ENV.has_key?(DEBUG_KEY) && DEBUG_VALS.any? { |v| v.casecmp?(ENV[DEBUG_KEY]) }, T::Boolean)

  if IS_DEBUG
    sig { void }
    def debug_consts
      self.constants.each { |const|
        puts "#{const}: #{self.const_get(const).inspect}"
      }
    end

    sig { params(log: String).void }
    def debug(log)
      puts(log)
    end
  else
    sig { void }
    def debug_consts
    end

    sig { params(log: String).void }
    def debug
    end
  end

  @@added_methods = []
  def self.method_added(name)
    # HACK: Sorbet runtime workaround <dru 2020-06-10>
    return if @@added_methods.include?(name)
    @@added_methods.push(name)

    super name 

    proxy = Module.new {
      define_method(name) { |*args|
        Setup::debug("starting #{name} with args: #{args.inspect}...")
        super *args
        Setup::debug("#{name} completed.")
      }
    }

    self.prepend(proxy)
  end
end
