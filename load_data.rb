#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rubygems'
require 'haml'
require 'active_record'
require 'sqlite3'
require 'awesome_print'
require 'pp'
require 'yaml'
require 'switch_data_parser'
require 'network_data_translator'
require 'data_mapper'
require 'model'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/db.sql')

DATA_DIR         = File.join(File.dirname(__FILE__), 'data')

CONFIG_DIR       = File.join(DATA_DIR, 'switch_config')
BRIDGE_TABLE_DIR = File.join(DATA_DIR, 'switch_bridge_table')
MCOLLECTIVE_DIR  = File.join(DATA_DIR, 'mcollective')

raise 'fatal error!' unless Network.table_exists?

include DataMapper

if Network.all.length == 0
  load_data ARGV
  map_data
end
