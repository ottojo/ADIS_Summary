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

### Server Side Performance Metrics

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

(TODO)
