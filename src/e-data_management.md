# Data Management: Sever-Side State

Data is stored both on server and client, and data is exchanged in requests and responses.
Examples for client data include:

* Cached resources
* Cookies
* JS engine state

Server data includes:

* Application data
* Session state
* Application state

The server holds *static* resources and *dynamic* application state.
Application state may include:

* User accounts and preferences
* Dynamically generated content
  * recommendations
  * shopping cart
  * messages between users
* Cached and aggregated data

Aspects of server-side state include:

* how to interact with the server state
* how data is modeled
* mutability of data
* security
* storage duration
* access patterns

Resulting from those aspects are design choices regarding server-side state:

## Storage Options
Options are:

### main memory
  * application state
    * program memory (stack + heap)
    * usually managed by language runtime
  * in-memory databases
    * provide access API
    * may provide guarantees about integrity, consistency, visibility
    * examples: sqlite (in-memory version), h2, many more
  * both easy to use and fast access time
  * drawbacks:
    * volatility (data loss on process stop/restart, overhead otherwise)
    * small size
  * popular for short lived data with fast access requirements

### local storage
* file system (flat files)
  * advantages:
    * easy to use
    * well supported
    * persistent
    * easy to backup
    * large size
  * disadvantages
    * unindexed
    * unstructures
    * no guarantees for concurrent writes etc
  * popular for simple applications
* databases
  * advantages:
    * data is structured
    * indexed
    * allow complex search operations
    * allow relational data
    * large size
    * transaction support -> consistency
    * usually allow distributed setups
    * integration with other services through standard interfaces (SQL)
  * drawbacks:
    * complex API
    * complex management and administration
  * popular for complex structured application data
    * relational databases like postgresql, sqlite, mariadb
    * noSQL databases, such as k/v stores, document or graph databases

### remote storage
* information systems like CRMs
* external web services (database server, remote FS)
