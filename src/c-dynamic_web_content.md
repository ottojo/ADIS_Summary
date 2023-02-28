# Dynamic Web Content
## Client-side dynamicity
* Generated within browser
* Related to presentation of content

## Server-side dynamicity
* automatic updating of static files
* webserver delegates requests to external programs
  * e.g. CGI script
* webserver executes scripts internally
  * e.g. php module
* webserver has builtin site-gerneration code
  * tight coupling between webserver and application

## Creating dynamic web content
* some program takes http requests as input and produces web resources (HTML) as output
  * e.g. java servelet
* code may be embedded into web resource, inserting code output into resource
  * e.g. java server faces, PHP

### Server Side Includes
* Directives inserted into HTML
* executed by the server, but may delegate to CGI scripts

### External Programs: CGI
* Specifies interaction between webserver and external programs (CGI scripts)
* Server spawns new process for each request
* HTTP headers passed via env variables
* HTTP body passed via stdin
* CGI script may produce entire HTTP response, or only essential headers and body (remaining data added by server)
* Modules for interacting with CGI webserver exist in programming languages, such as CGI.pm in perl

Drawbacks:

* Process creation may be slow
* Script initialization happens on every request
* Limited communication channel in stdin/out

### Alternative: FastCGI
* Binary protocol
* via unix socket/named pipe/tcp connection
* Script keeps running and processes multiple request
* Multiple (remote) FastCGI applications may be running and accessed by single web server
  * allows load balancing
  * separates web and application server

### SCGI (Simple Common Gateway Interface): Alternative to FastCGI
* Simplifies interface: non-binary interface
* Easier to implement than FastCGI

### Problems with CGI
* CGI programs often use same security context as web server
* Apache allows running CGI scripts as specified user/group
