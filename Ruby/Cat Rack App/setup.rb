#!/usr/bin/env ruby

# creates the sqlite3 database, schema and seeds

# frozen_string_literal: true

# typed: strong

require 'bundler/setup'
require 'sorbet-runtime'
require 'sqlite3'

SQLITE_DIR  = T.let(Pathname.new('sqlite3/'), Pathname)
SQLITE_FILE = T.let(SQLITE_DIR.join('cat.db'), Pathname)

SQLITE_SCHEMA = T.let({
  pronouns: %i[id subject_pronoun object_pronoun possessive_adjective possessive_pronoun reflexive_pronoun],
  cats: %i[id name pronoun_id],
  facts: %i[id fact]
}, T::Hash[Symbol, T::Array[Symbol]])

module Setup
  extend T::Sig

  sig { void }
  def self.main
    handle_dir(SQLITE_DIR)

    database = create_db(SQLITE_FILE)

    create_schema(database, SQLITE_SCHEMA)
  end

  sig { params(path: Pathname).void }
  def self.handle_dir(path)
    Kernel::abort if Dir.exist?(path.to_s)
    Dir.mkdir(path.to_s)
  end

  sig { params(path: Pathname).returns(SQLite3::Database) }
  def self.create_db(path)
    SQLite3::Database.new(path.to_s)
  end

  sig {  params(db: SQLite3::Database, data: T::Hash[Symbol, T::Array[Symbol]]).void }
  def self.create_schema(db, data)
     
  end
end

Setup::main
# # Create a table
# rows = db.execute <<-SQL
#   create table numbers (
#     name varchar(30),
#     val int
#   );
# SQL
#
# Execute a few inserts
# {
#   "one" => 1,
#   "two" => 2,
# }.each do |pair|
#   db.execute "insert into numbers values ( ?, ? )", pair
# end
#
# Find a few rows
# db.execute( "select * from numbers" ) do |row|
#   p row
# end
#
# Create another table with multiple columns
#
# db.execute <<-SQL
#   create table students (
#     name varchar(50),
#     email varchar(50),
#     grade varchar(5),
#     blog varchar(50)
#   );
# SQL
#
# Execute inserts with parameter markers
# db.execute("INSERT INTO students (name, email, grade, blog)
#             VALUES (?, ?, ?, ?)", ["Jane", "me@janedoe.com", "A", "http://blog.janedoe.com"])
#
# db.execute( "select * from students" ) do |row|
#   p row
# end
