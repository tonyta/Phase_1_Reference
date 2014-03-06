CSV
====
[Week 2: Parsing Data 1](https://github.com/otters-2014/parsing-data-1-csv-in-csv-out-challenge)

[Ruby Docs](http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html)

Before doing *anything* make sure you `require 'csv'`

### Reading

We are mostly reading CSV from a file. There are two main methods for this:
- `#read`: which reads the entire file at once
- `#foreach`: which reads one row at a time (you probably want this one)