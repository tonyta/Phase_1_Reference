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
# => [ [ 'George',  'Smith',  '31' ],
#      [ 'Samuel',  'West',   '29' ],
#      [ 'Brenda',  'Byrnes', '43' ],
#      [ 'Matthew', 'Conner', '32' ] ]
```

#### #foreach

`foreach` will return a CSV enumerable object that will take a block:
``` ruby
CSV.read('people.csv') do |row|
  puts row.join(' ')
end
```
The output would be:
```
George Smith 31
Samuel West 29
Brenda Byrnes 43
Matthew Conner 32
```

### Options

#### Headers

Passing the argument `headers: true` will make CSV treat the first row as the header. Instead of an objects that act like arrays, the returned objects will act like hashes. *Careful: without other arguments, the keys will be strings!*

For example, `people_headers.csv':
```
first_name, last_name, age
George,Smith,31
Samuel,West,29
Brenda,Byrnes,43
Matthew,Conner,32
```

``` ruby
require 'csv'

CSV.read('people.csv, ')
# =>  #<CSV::Table mode:col_or_row row_count:5>

CSV.read('people.csv, ')[0]
# => #<CSV::Row "first_name":"George" "last_name":"Smith" "age":"31">

CSV.read('people.csv, ')[0]['first_name']
# => "George"

```

Turning on headers while using `#foreach` yields similar results but in an enumberable.