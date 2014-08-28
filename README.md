###SalesEngine
######Sales Engine ~= ActiveRecord Lite
*used TDD to build a system that links several data files
*create relationships that allow querying of data between classes
*focus on single responsibility principle and encapsulation

######Using Sales Engine
*Entry point:
  ```ruby
  engine = SalesEngine.new
  ```
*Load default data:
  ```ruby
  engine.startup
  ```
  - by default, ```engine.startup``` will load and parse the built-in csv files

*Load data from alternate directory
  - you may pass an optional argument to Sales Engine upon initialize:
  ```ruby
  engine = SalesEngine.new(my_directory)
  ```
  -note: this will change the directory, but you will manually need to change the
  name of each file if they do not match the following naming conventions:
  */customers.csv
  */invoice_items.csv
  */invoices.csv
  */items.csv
  */merchants.csv
  */transactions.csv

######Relationships
  These are the relationships provided by Sales Engine
```Merchant```

```items``` returns a collection of ```Item``` instances associated with that merchant for the products they sell
```invoices``` returns a collection of ```Invoice``` instances associated with that merchant from their known orders

```Invoice``
Invoice

```transactions``` returns a collection of associated ```Transaction``` instances
```invoice_items``` returns a collection of associated ```InvoiceItem``` instances
```items``` returns a collection of associated ```Items``` by way of ```InvoiceItem``` objects
```customer``` returns an instance of ```Customer``` associated with this object
```merchant``` returns an instance of ```Merchant``` associated with this object
