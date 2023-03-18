# Introduction to Scalability

## Part 1

The main requirements for a large scale web application are

* reliability
* scalability
* maintainability

A scalable system is able to cope with varying load.
This might require utilizing additional resources, or graceful degradation in case of temporary overload.
Scalability is not the same as performance, as a system which has good performance for a single user it might still not scale well for large numbers of users.

### Client Side Performance Metrics

* DNS lookup time
* Time to first byte TTFB
* Time to first contentful paint (FCP)
* Time to start render
* Time to interactive (TTI)

### Server Side Performance Metrics {#server-side-performance-metrics}

* request throughput (requests per second)
* response times (time between receiving request and responding)
* hardware utilization
* availability
* uptime

#### Response Times

Both average and peak response time can be measured..
However, those statistics are of limited relevance, since the distribution is usually not normal or uniform.
A better way of assessing response times are percentiles (99% of all responses arrive within $p_{99}$).
Percentile plots (hockey stick plots) allow comparing response times of multiple systems.

#### Throughput vs Response Time

Under load, increased throughput negatively affects response times.
This might be due to requests being queued for example.

## Part 2

### Load Characteristics

Load: externally assigned work for the system

Load is characterized by load parameters:

* web server load
  * number of requests
  * type of requests
  * target URIs
* application backend load
  * application specific, e.g. ratio of read/write DB operations

Roary example load parameters:

* add-post operations per second
* view-post operations per second
* ratio between both

secondary load parameters in this example might be the number of followers and subscriptions per user,
or the distribution of those among the user-base.

### Scalability Strategies

* Scale-Up (vertical): Adding more resources to existing machines
  * inherent physical limits
* Scale-Out (horizontal): Adding more machines
  * requires distribution

#### Scale Cube

Axes:

* horizontal duplication
  * cloning services
  * replicating instances such as DBs
  * load-balancing between entities
* functional decomposition
  * separation of services
  * partitioning of data sets
* data partitioning
  * sharding of service instances (dedicated instances for certain groups of users)
  * distribute dataset based on key

Example for scaling up users+products database:

* Replication of entire database allows more concurrent read operations
* Separating users and products tables into two instances increases capacity for each and allows independent scaling
* Splitting entire dataset into two databases by key

All three approaches can be combined, even for this simple database example.

#### General Strategies

* stateless components are easier to scale and replicate
* avoid single points of failure
* shared state makes replication and sharding difficult
* asynchronous services and calls prevent bottlenecks
* caching may be used on all architecture layers and can have huge benefits
* monitoring load and performance is crucial
