# Interaction/Communication

## HTTP2
* Application layer interface untouched
* Data layout changed
* Improvements:
  * stream multiplexing (parallel HTTP transactions, priorities)
  * binary encoding, header and data compression
  * server push
* HTTP3: HTTP over QUIC (UDP) currently draft

## Client-Backend Communication
Required for:

* AJAX: load additional information by initiation of client
* SPAs:
  * accessing business data
  * triggering server-side operations
  * loading code
  * loading HTML

### REST
"Representational state transfer" is a style and set of guidelines, which supports large-scale web applications
and works well with HTTP:

* client-server architecture with request-response communication
* statelessness: client manages session state, each request includes all necessary information (such as pagination cursor versus server-stored pagination state for session)
* cacheability: responses labeled with cacheability
* layered system: clients, servers, intermediaries such as caches, load balancers, etc
* uniform interface:
  * small set of generic operations: create, read, update, delete. Applicable to all resources in system
  * identification of resources:
    * architecture is "resource oriented", such as users, products or blog posts.
    * Resources are identified by URIs, which are independent from resource representation
  * manipulation of resources via their representations: request resource (in some representation), modify, send changed resource back
  * self-descriptive messages: message contains metadata, e.g. representation used via content-type header
  * hypermedia as the engine of application state:
    * application state changes on following links, submitting forms or following redirections
    * clients do not need to know internal application layout, base URL allows exploring the application
    * might require additional formats for non-HTML data

### GraphQL
The goal of GraphQL is to avoid disadvantages of REST, and in particular make it possible to retrieve only the necessary data, and all of it in a single operation.
An example from Roary would be requesting some information about a user and their last three posts.
This would require multiple requests when following REST (user, post list, individual post-details).

In GraphQL, the query specifies the exact fields required, such as:
```graphql
query {
    User(id: 34) {
        name
        roars(last: 3) {
            message
        }
    }
}
```
This requests only the name of the users, and the text of the last three roars.
Responses are provided in JSON format.

Using GraphQL requires a schema definition for the available resources, which serves as a template for possible queries.
Queries can also be created to modify data, or subscribe to update-events.
The server has to implement some functions to resolve queries, libraries are available to connect GraphQL queries to data sources such as databases.

Client-side frameworks are available which link views with GraphQL queries.

While GraphQL eliminates REST problems such as transferring unnecessary data in multiple requests, and allows for fast frontend iteration without backend modifications,
drawbacks exist:
Caching is more complex, since data is often incomplete, and queries can be very complex.
This leads to large processing demands on the server, which also vary widely by request.

### Websockets
HTTP is not suited for interactive two-way communication (prime example: web chat application).
An option to solve this would be AJAX polling, or AJAX long polling, but this requires complex server-side coordination
and bears the hidden cost of HTTP (headers, TLS handshakes, etc).

The modern approach however is WebSocket:
WebSocket describes both an API and protocol:

* reliable client-server interaction
* compatible with HTTP connections
* TLS integrated
* callback-based API suited for JS

The client opens a WebSocket connection to the server, and can then send messages and react to incoming messages.
The server listens to incoming requests to open connections, and then interacts with the connection.

The WebSocket protocol is compatible with HTTP, and uses a GET request to initiate a connection.
After the response, the protocol is switched to WebSocket.
Subsequent messages are not HTTP requests, but use the WebSocket wire protocol.
WebSocket packets have at least two bytes overhead and allow binary payloads.

Application protocols are usually used on top of WebSocket, which can already be specified when initiating the connection.

## Backend-Backend Communication
This type of communication occurs between servers which are part of the backend.
An example might be communication between an application server and database server.

Previously mentioned protocols like REST and GraphQL might be used between servers, but there are additional options:

### RPC: Remote Procedure Call
* Resembles a function invocation that happens on a remote host
* request-reply interaction
* Extends REST, which only allows CRUD operations
* requires marshaling (serialization) of parameters and result

Popular implementations:

* Java RMI: transparent method invocation between JVMs
* gRPC: language agnostic, based on HTTP/2 and protobuf. Also able to handle streams of data.
* SQL: known for DB access, usually embedded into database connectors

### Web Services Communication
* no standardized definition
* not widely used?

SOAP:

* XML based message protocol
* multi paradigm: request-reply, request only, multi-reply, multicast, etc ("message exchange patterns")
* needs underlying protocol such as HTTP
* defines application data encoding based on XML schema

WSDL "Web Service Description Language":

* XML format for describing web services, basic building blocks:
  * types: specify messages (such as SOAP)
  * interface: specify functionality
  * binding: how to access service (protocols)
  * service: where to access functionality
* can be used for code generation

## Advanced Concepts
### Messaging
* Interconnect servers by message bus

#### Queuing
* messages addressed to queues
* queues resemble mailboxes
* receiver asynchronously fetches messages from queue
* queue decouples sender and receiver

#### Pub-Sub
* messages not specifically addressed
* receivers subscribe to desired messages
* could be topic based or content based
* implementation could be one queue per topic

#### Implementation Notes
* library approach: queue is integrated into receiver application
* server approach: queue located on dedicated message server
  * replication of server allows scaling

Examples:

* IBM MQ
  * combines queuing and pubsub
* Apache Kafka
  * persistent message stored
  * topic-based pubsub
  * allows stream processing
  * scalability:
    * partitioning of topic queues
    * receivers organized in consumer groups, which subscribe to topics. Consumer group could have one receiver per partition of topic queue.

### SEDA: Staged Event-Driven Architecture
* motivation: efficient internet services even for load spikes
* idea: pipelining
* stage input: event queue
* stage outputs: events for subsequent stages

Advantages:

* independent processing units
* decoupled stages
* parallelization of stages

Disadvantages:

* queues can become bottlenecks
* complex architecture
* nowadays: no performance improvement compared to (modern) threading systems

### Back Pressure
* concept for preventing exhaustion of service resources
* idea: block resource consumption until resources are available
* examples:
  * block additional connections
  * block producers from submitting new messages
  * block callers from invoking procedures
* might lead to pipeline stalls, but prevents system from crashing (graceful degradation)
