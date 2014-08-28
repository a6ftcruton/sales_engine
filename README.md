#SalesEngine

###Sales Engine: Because ActiveRecord wasn't built in a day

  -used TDD to build a system that links several data files

  -create relationships that allow querying of data between classes

  -focus on single responsibility principle and encapsulation

###Using Sales Engine
  **Entry point:**
  ```ruby
  engine = SalesEngine.new
  ```
  **Load default data:**
  ```ruby
  engine.startup
  ```
  - by default, `engine.startup` will load and parse the built-in csv files

  **Load data from alternate directory**
  - you may pass an optional argument to Sales Engine upon initialize:
  ```ruby
  engine = SalesEngine.new(my_directory)
  ```
  -note: this will change the directory, but you will manually need to change the
  name of each file if they do not match the following naming conventions:

  ```
  /customers.csv
  ```

  ```
  /invoice_items.csv
  ```

  ```
  /invoices.csv
  ```

  ```
  /items.csv
  ```

  ```
  /merchants.csv
  ```

  ```
  /transactions.csv
  ```

###Relationships
  *Sales Engine provides the following relationships:*

#####Merchant

`items` returns a collection of `Item` instances associated with that merchant for the products they sell
`invoices` returns a collection of `Invoice` instances associated with that merchant from their known orders

#####Invoice

`transactions` returns a collection of associated `Transaction` instances
`invoice_items` returns a collection of associated `InvoiceItem` instances
`items` returns a collection of associated `Items` by way of `InvoiceItem` objects
`customer` returns an instance of `Customer` associated with this object
`merchant` returns an instance of `Merchant` associated with this object

#####InvoiceItem

`invoice` returns an instance of `Invoice` associated with this object
`item` returns an instance of `Item` associated with this object

#####Item
`invoice_items` returns a collection of `InvoiceItems` associated with this object
`merchant` returns an instance of `Merchant` associated with this object

#####Transaction

`invoice` returns an instance of `Invoice` associated with this object

#####Customer

`invoices` returns a collection of `Invoice` instances associated with this object.
