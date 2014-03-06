CSV
====
[Week 2: Parsing Data 1](https://github.com/otters-2014/parsing-data-1-csv-in-csv-out-challenge)

[Ruby Docs](http://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html)

Before doing *anything* make sure you `require 'csv'`

### Reading

We are mostly reading CSV from a file. There are two main methods for this:
- `#read`: which reads the entire file at once
- `#foreach`: which reads one row at a time (you probably want this one)
For either, you will pass the path to the csv file as a string. For example:
`CSV.foreach('path_to/my_file.csv')`
#### #read
`read` will return and array of arrays of strings. For example, if your file (`people.csv`) looks like:
```
George,Smith,31
Samuel,West,29
Brenda,Byrnes,43
Matthew,Conner,32
```
then...
``` ruby
require 'csv'

CSV.read('people.csv')
# => [ [ 'George',  'Smith',  31 ],
#      [ 'Samuel',  'West',   29 ],
#      [ 'Brenda',  'Byrnes', 43 ],
#      [ 'Matthew', 'Conner', 32 ] ]
``