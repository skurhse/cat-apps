#!/usr/bin/env ruby

# creates the database, tables and seeds

# frozen_string_literal: true

# typed: strong

IS_DEV = %w[1 yes y true].include? ENV['CAT_RACK_APP_DEV']

require 'bundler/setup'

require 'sequel'
require 'sorbet-runtime'
require 'sqlite3'

require 'byebug' if IS_DEV

require_relative '../lib/debug'

class Setup
  extend T::Sig
  extend Debug

  WORK_DIR = T.let(Pathname.new(Dir.pwd), Pathname) 

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
  def main
    handle_dir(SQLITE_DIR)

    database = create_db(SQLITE_FILE)

    create_tables(database, SQLITE_TABLES, SQLITE_COLUMNS)

    # seed_records(database, SQLITE_TABLES, SQLITE_RECORDS)

    puts('done')
  end

  sig { params(path: Pathname).void }
  def handle_dir(path)
    if Dir.exist?(path.to_s)
      puts("FATAL: dir #{path} already exists")
      Kernel.abort
    end
    Dir.mkdir(path.to_s)
  end

  sig { params(path: Pathname).returns(Sequel::Database) }
  def create_db(path)
    # TODO: Use URL <dru 2020-06-08>
    Sequel.connect("sqlite://#{path.relative_path_from(WORK_DIR)}")
  end

  sig { params(database: Sequel::Database, tables: T::Array[Symbol], columns: T::Hash[Symbol, T.proc.void]).void }
  def create_tables(database, tables, columns)
    tables.each do |table|
      database.create_table(table, &columns[table])
    end
  end

  sig { params(database: Sequel::Database, tables: T::Array[Symbol] ).void }
  def seed_records
  end
end

Setup.new.main
