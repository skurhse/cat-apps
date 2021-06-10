#!/usr/bin/env ruby

# creates the database, tables and seeds

# frozen_string_literal: true

# typed: strong

require 'bundler/setup'

require 'sequel'
require 'sorbet-runtime'
require 'sqlite3'

module Setup
  extend T::Sig

  # TODO: breakout debug into module <dru 2020-06-09>

  DEBUG_KEY = T.let('CAT_RACK_APP_DEBUG', String)
  DEBUG_VALS = T.let(%w[1 yes y true].freeze, T::Array[String])

  IS_DEBUG = T.let(ENV.has_key?(DEBUG_KEY) && DEBUG_VALS.any? { |v| v.casecmp?(ENV[DEBUG_KEY]) }, T::Boolean)

  if IS_DEBUG
    sig { void }
    def self.debug_consts
      self.constants.each { |const|
        puts "#{const}: #{self.const_get(const).inspect}"
      }
    end

    sig { params(log: String).void }
    def self.debug(log)
      puts(log)
    end
  else
    sig { void }
    def self.debug_consts
    end

    sig { params(log: String).void }
    def self.debug
    end
  end

  def self.singleton_method_added(name)
    proxy = Module.new {
      define_singleton_method(name) { |*args|
        Setup::debug("starting #{name} with #{args.inspect}...")
        super *args
        Setup::debug("#{name} completed.")
      }
    }
    self.prepend(proxy)
    super name
  end

  PROJECT_DIR = T.let(Pathname.new(__dir__), Pathname)

  SQLITE_DIR  = T.let(PROJECT_DIR.join('sqlite3/'), Pathname)

  SQLITE_FILE = T.let(SQLITE_DIR.join('cat.db'), Pathname)

  # CAV: Order-dependent <dru 2020-06-08>
  SQLITE_TABLES = T.let(%i[pronouns cats facts].freeze, T::Array[Symbol])

  SQLITE_COLUMNS = T.let({
    pronouns: lambda {
      primary_key :id
      column :subject_pronoun,      :text
      column :object_pronoun,       :text
      column :possessive_adjective, :text
      column :possessive_pronoun,   :text
      column :reflexive_pronoun,    :text
    },
    cats: lambda {
      primary_key :id
      column :name, :text
      foreign_key :pronoun_id, :pronouns
    },
    facts: lambda {
      primary_key :id
      column :fact, :text
    }
  }.freeze, T::Hash[Symbol, T.proc.void])

  debug_consts

  sig { void }
  def self.main
    handle_dir(SQLITE_DIR)

    database = create_db(SQLITE_FILE)

    create_tables(database, SQLITE_TABLES, SQLITE_COLUMNS)

    # seed_records(database, SQLITE_TABLES, SQLITE_RECORDS)

    puts('done')
  end

  sig { params(path: Pathname).void }
  def self.handle_dir(path)
    Kernel.abort if Dir.exist?(path.to_s)
    Dir.mkdir(path.to_s)
  end

  sig { params(path: Pathname).returns(Sequel::Database) }
  def self.create_db(path)
    # TODO: Use URL <dru 2020-06-08>
    Sequel.connect("sqlite://#{path}")
  end

  sig { params(database: Sequel::Database, tables: T::Array[Symbol], columns: T::Hash[Symbol, T.proc.void]).void }
  def self.create_tables(db, tables, columns)
    tables.each do |table|
      database.create_table(table, &columns[table])
    end
  end

  sig { params(database: Sequel::Database, tables: T::Array[Symbol] ).void }
  def self.seed_records
  end
end

Setup.main
