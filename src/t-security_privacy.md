# Security and Privacy
## Secured Communication
### TLS
* HTTPS: HTTP using TLS
* authenticated server (sometimes also client)
* encryption

### Browser Policies
* HSTS: HTTP Strict Transport Security
  * forces usage of HTTPS
  * prevents downgrade attacks to HTTP
  * enabled by special HTTP header `Strict-Transport-Security`
* CORS: Cross-Origin Resource Sharing
  * relaxes same origin policy
  * server explicitly allows browser to e.g. fetch scripts from other server
* CSP: Content Security Policy
  * protects against XSS
  * `Content-Security-Policy` headers instruct browser which resources are allowed to be loaded
* SRI: Subresource Integrity
  * allows specification of checksum for third party resources
  * browser verifies checksum

## Authentication
Problem: HTTP is stateless. Possible solutions:

* Send credentials with every access
* Include some access token with every access
  * could authenticate user for multiple services
  * unauthenticated requests are redirected to ID provider, which then redirects back with token
  * token could by implemented by signed/encrypted cookie
  * token could move from id provider to server via some other channel
* Authenticate session context once

Challenges:

* creation of access token
* single sign on

### HTTP digest
* integrated into HTTP
* browser shows login popup
* should only be used with TLS

### Shibboleth
* protocol for outsourcing to external identity provider
* federated: there could be many identity providers. optionally provides discovery service
* intermediary token can carry additional attributes

### OpenID/OAuth
* underlying protocol: OAuth 2.0
  * OAuth designed to allow sharing of data between servers (e.g. allow printing service to access data of photo storage service)
* ID providers: Google, PayPal, Microsoft, etc

### JWT: JSON web Token
* format for "claims" (assertions, tokens)
* JSON based
* contains payload which asserts certain properties or identity, and signature

## Privacy
### Privacy by Design
* proactive not reactive
* privacy as default setting
* embedded into design instead of add-on
* full functionality including privacy instead of functionality/privacy trade
* end-to-end security
* transparency
* respect for user privacy (user centric)

### Data
* data at rest
  * minimize amount of stored data
  * encrypt data
* data in transit
  * encryption: HTTPS
  * server authentication
  * also applies to internal communication, including client authentication
