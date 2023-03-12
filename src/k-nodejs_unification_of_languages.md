# Node.js and Unification of Languages

## Emerging Challenges

* Scalability: C10k-like problems for dynamic content
* Coordination between server and client, with many clients
* Interaction between concurrent requests
* Near-real-time information distribution


A traditional web application usually features

* Isolation of individual requests at the server
* Application state exclusively in database

while a modern application wants to use techniques such as
long polling, wherein the server delays a response until some
event has occurred (such as a new chat message being sent).
This requires a new programming model with

* Explicit concurrency support (inter-request interactions)
* Support for long-running and event-triggered requests
* Scalability for dynamic content generation

## Event-driven Web Application Runtime

This model extends the [reactor pattern](#reactor-pattern)
by allowing the event loop to execute arbitrary application
code such as making database queries and generating HTML
output.

## Node.js

* Asynchronous, event-driven JS runtime
* JS is used because it does not have a threading model or
  standard IO functionality, as all those are provided
  exclusively by the runtime
* Extensive use of callbacks
* Framework `express` simplifies HTTP server creation
* All callbacks executed sequentially
* `events` library provides inter-request interaction
* `npm` package manager and package registry

## Unification of Languages

Using the same programming language for client and server has
many advantages, such as easier debugging and less duplication
of server and client code.

A full JS stack has the advantage of not requiring transpilation
or code generation for the client side.
Also, developers might already be familiar with JS because of
its prominence for frontend code.

Popular JS stack "MEAN": MongoDB, Express, AngularJS, Node.js.

