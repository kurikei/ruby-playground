#!/usr/bin/env ruby
require 'dotenv/load'
require 'google/cloud/bigquery'

bigquery = Google::Cloud::Bigquery.new(
  project: ENV['PROJECT_ID']
)

sql = <<'SQL'
  SELECT 1
SQL

data = bigquery.query sql, legacy_sql: false
p data
