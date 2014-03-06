# preamble for using sqlite3 gem
require 'sqlite3'

$db = SQLite3::Database.new('appropriate_handle')

$db.execute("DROP TABLE contacts")
#examples
# creating a table with constraints:
$db.execute(
  <<-SQL
    CREATE TABLE contacts (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      first_name VARCHAR(64) NOT NULL,
      last_name VARCHAR(64) NOT NULL,
      company VARCHAR(64) NULL,
      phone VARCHAR(64) NULL,
      email VARCHAR(128) NULL,
      created_at DATETIME NOT NULL,
      updated_at DATETIME NOT NULL
    );
  SQL
)
# inserting with placeholders:
$db.execute(
			"INSERT INTO contacts
			(first_name, last_name, company, phone, email, created_at, updated_at)
			VALUES
			(?,?,?,?,?,DATETIME('now'),DATETIME('now'))", 
			'Calder', 'Wishne'
			)
# the same using an array:
$db.execute(
			"INSERT INTO contacts
			(first_name, last_name, company, phone, email, created_at, updated_at)
			VALUES
			(?,?,?,?,?,DATETIME('now'),DATETIME('now'))", 
			['Harold', 'Ramis']
			)

# the same using a hash:
def insert(first_name, last_name)
	$db.execute(
				"INSERT INTO contacts
				(first_name, last_name, company, phone, email, created_at, updated_at)
				VALUES
				(:first_name, :last_name, NULL, NULL, NULL,DATETIME('now'),DATETIME('now'))", 
				"first_name" => "#{first_name}", "last_name" => "#{last_name}"
				)
end

insert("Bill", "Murray")

# querying the database and returning an array of arrays:
p $db.execute("SELECT * FROM contacts WHERE first_name = 'Harold'")

# the following command changes the output of $db.execute to an array of hashes:
$db.results_as_hash = true

# observe:
p data_hash = $db.execute("SELECT * FROM contacts WHERE first_name = 'Harold'")[0]

# This formatting is super useful for instantiating objects. Here is an example:

class Test
	attr_reader :first_name, :last_name
	def initialize(args)
		@first_name = args.fetch("first_name")
		@last_name = args.fetch("last_name")
	end
end

test = Test.new(data_hash)
puts test.first_name, test.last_name











