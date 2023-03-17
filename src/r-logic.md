# Logic
## Application Logic
* logic required for generating dynamic web pages or providing application services and functions
* external and internal endpoints
* sequential execution of application logic
  * application server sequentially calls and waits for results from DBs and backend services
  * does not scale for large number of backend services
* event-driven and asynchronous execution
  * first, dispatch all calls
  * second, wait for all results
  * this might require additional coordination or dependency management

## Stateless and Stateful Application Logic
* stateless: independent request-response cycles, desirable for scalability
* specific meaning of state:
  * session state
  * server-side application state ("stateful resources")

Examples:
* Video transcoding service:
  * stateless service: each individual request contains all required information
  * easy scalability: replication
* Game:
  * stateful application logic (game state) maintained by server
  * scalability strategy: sharding of game instances without shared state
* Calendar:
  * stateless application logic, stateless request handling: state is queried from DB for every request, no dependency between requests
  * database maintains stateful resources: mutable data
  * scalability: replication of application servers, scaling of DB (see above)

Stateless logic is preferred whenever possible.
It might be possible to decompose application logic into stateless and stateful parts.

## Distributing Application Logic
### Functional Partitioning
* Application specific characteristics
* Decouple application functions
* Application functions might still access the same backend
* Allows independent scaling of endpoints

### Horizontal Duplication (Replication)
* Multiple application servers run same copy of application logic
* often requires stateless request handling
* arbitrary load balancing strategy

### Data Partitioning (Sharding)
* Designate instance to handle designated set of requests
* Partitioning based on e.g. user id, session id, client IP, etc
* allows stateful request handling logic
* load balancing needs to be aware of sharding

### Shared and Global State
* state often handled by database system
* transactional semantics challenging for distributed databases
* querying state from DB might not be fast enough

Alternatives:

* state bound to individual shard: concurrency only within single application server
* distributed state between application instances: requires distributed concurrency mechanism
  * actor model
  * event-driven model (shared event bus, pubsub)
  * distributed transactions

## Background Tasks
* request independent application logic
  * maintenance tasks
  * data analysis tasks
* might be long running compared to requests
* often requires access to backend and application state

### Batch Processing
* long running task
* fully available and bounded input data

### Stream Processing
* continuous processing task
* input data unbounded and not available in advance
* results might be incomplete or approximate
* example: trending topic analysis on social networks

## Event Sourcing and CQRS
* CQRS: Command Query Responsibility Segregation
* idea: differentiate commands (no return value, might have side effects) and queries (returns data, no side effects)
* application to event based programming:
  * command model: state-changing operations, write only
  * query model: read only query operations
  * separation of models allows independent development and scaling strategies
* application to event sourcing:
  * command model creates events
  * query model interacts with materialized state representation
  * explicit eventual consistency
  * easy scaling of query model, loose coupling of components
