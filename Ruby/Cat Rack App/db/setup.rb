#!/usr/bin/env ruby

# creates the cat rack sqlite3 database, tables and seeds

# frozen_string_literal: true

# typed: strong

require 'bundler/setup'
require 'sorbet-runtime'
require 'sequel'
require 'sqlite3'

SQLITE_DIR  = T.let(Pathname.new('sqlite3/'), Pathname)
SQLITE_FILE = T.let(SQLITE_DIR.join('cat.db'), Pathname)

# CAV: Order-dependent <dru 2020-06-08>
SQLITE_TABLES = T.let(%i[
  pronouns
  cats
  facts
].freeze, T::Array[Symbol])

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

SQLITE_SEEDFILES = T.let([
  Pathname.new()
  Pathname.new()
  Pathname.new()
], T::Hash[Symbol, Pathname])

module Setup
  extend T::Sig

  sig { void }
  def self.main
    handle_dir(SQLITE_DIR)

    database = create_db(SQLITE_FILE)

    create_tables(database, SQLITE_TABLES, SQLITE_COLUMNS)

    seed_records(database, SQLITE_TABLES, SQLITE_RECORDS)

    puts('done')
  end

  sig { params(path: Pathname).void }
  def self.handle_dir(path)
    Kernel.abort if Dir.exist?(path.to_s)
    puts("creating directory #{path}")
    Dir.mkdir(path.to_s)
  end

  sig { params(path: Pathname).returns(Sequel::Database) }
  def self.create_db(path)
    puts "creating database #{path}"
    # TODO: Use URL <dru 2020-06-08>
    Sequel.connect("sqlite://#{path}")
  end

  sig { params(database: Sequel::Database, tables: T::Array[Symbol], columns: T::Hash[Symbol, T.proc.void]).void }
  def self.create_tables(db, tables, columns)
    puts("creating tables #{tables}")
    tables.each do |table|
      database.create_table(table, &columns[table])
    end
  end

  sig { params(database: Sequel::Database, tables: T::Array[Symbol] ).void }
  def seed_records
  end
end

Setup.main
