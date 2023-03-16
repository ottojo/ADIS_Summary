# State
## State in Scalable Web Architectures
In this section, we consider server-side state.
We have to differentiate the context of the state: request, session, long-term.
Additionally, we have to differentiate between ephemeral/volatile, derived and persistent state.

## Caching
Main idea: prevent duplicate work.

Challenges:

* potential for inconsistent state
* cache could become bottleneck
* failing/restarting caches may overload downstream components
* increased system complexity

Application of caching throughout the architecture:

* client side caching of responses
* outsourcing to CDNs
* reverse proxies with cache: serve static content and cached dynamically generated pages
* cache support on web servers: cache-control headers etc
* application servers: caching in language runtimes (bytecode for interpreted languages), caching of DB queries, application specific strategies
* database: various internal caching methods, caching of query results
* in-memory data stores: provides caching for other components
* backend services: caching of results

Rule of thumb: cache high up in the call stack (close to the client).

## Data Models
### Relational Model
* SQL for data definition, manipulation, querying
* transactions

### Key/Value
* hash table storage
* limited size key
* usually arbitrary value

### Document oriented
* similar to k/v, but structured document as value
* document usually JSON, XML, etc

### Graph Model
* data items as vertices and edges
* interesting if querying relationships between items is common operation (social network, road network)

### Column-oriented Model
* storage of tables by column instead of rows
* more complex insert operation
* efficient operations over large table, such as aggregation

## Functional Decomposition
Idea: Split application model into logical parts which can be separated.

* allows physical separation
* enables use of different data models
* join-logic must be handled by application

## Replication
Idea: Multiple copies of the same data.

* increases throughput
* increases availability (tolerate failure of a replica)
* reduces latency via geo-replication

Primary challenge: mutable data. This requires propagation of updates to achieve consistency between replicas.

### Leader-Follower Replication
* Dedicated leader database and set of replicas, called followers
* Only read-only applications sent to follower databases
* writes replicated from leader to follower
* replication might be done synchronously (within the write operation) or asynchronously

Replication Mechanism:

* statement based: direct execution of statements in replicas. statements must be deterministic.
* log based: append-only log of changes sent to replicas. might be "write-ahead log" of more low-level write operations
* application triggered: replication triggered and specified by user application

Properties/guarantees relating to consistency anomalies:

* read your own writes: guarantee of seeing previous write in subsequent read
* monotonic reads: guarantee that subsequent reads will never return a previous version of the state
* consistent prefix reads: data items observed in causally correct order

### Multi-Leader Replication
* Multiple instances handle write operations
* might be generalized to client-server interaction (e.g. for PWAs)

Main problem: write conflicts. Strategies for resolution:

* conflict avoidance: each data item has one authoritative leader which handles write operations
* convergence to consistent state: ensure all leaders agree after replication, such as by enforcing global order on update operations
* user-defined resolution: application specific

### Leaderless Replication
* always contact all instances, but only require certain number of responses (quorum)
* write quorum $w < n$ for $n$ replicas: writes possible even if replica is down
* sum of write and read quorum $w+r>n$, such as $w=r=\frac{n}{2}+1$
* optimization: smaller $r$ for read-heavy loads
* if $w+r \leq n$: increased risk of reading stale data

## Sharding/Partitioning
* Split a collection of data item into multiple partitions
* requires routing of requests to correct partition
* primary challenge: partitioning scheme which creates even distribution and allows rebalancing

Partitioning schemes:

* key range: shard = ranged partition of key space
  * straightforward
  * prone to skewed workloads
* hashed keys
  * no inherent support of range queries

Rebalancing shards: scale-out by adding instances, ideally with low migration effort

* dynamic partitioning (key based sharding): split keyspace of overloaded shard in two halves, assign one half to new shard
* fixed number of shards which is way larger than number of machines: new machine can take some existing shards
* fixed number of shards per machine: new machine picks some shards, splits them and hosts one half

Sharding is often combined with replication.

## Data Consistency
Consistency models define visibility semantics and system behavior.

### CAP Theorem
In case of a partition, a system can either

* focus on consistency, but loose availability, or:
* keep instance available, but not guarantee consistency

### PACELC Theorem
* In case of a network partition, you have to choose between availability and consistency.
* Else, in normal operation, you have to choose between latency and consistency.

### Harvest/Yield
* harvest: completeness of queries
* yield: probability of completing a request
* in some cases, an incomplete result is better than no result

## Event Sourcing
* alternative style for persisting data
* append-only sequence of (immutable) state-changes
* state computed by applying all state-changes in order
* event log is persisted, for example on append-only k/v store

Benefits:

* Persistence of state history
* explicit consistency model

Drawbacks:

* unconventional
* increased storage requirements
