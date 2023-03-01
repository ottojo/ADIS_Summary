# Server-side Scripting

Scenario: Static HTML page should be enriched by dynamic content.

Here, inside-out scripting is considered. This means scripts are placed
inside HTML document. The script output is inserted at their location in
the HTML document.

Execution of the scripts:

* External script interpreter, spawned by server
* Long-ruinning external execution environment
  * Similar benefits to FastCGI vs CGI
  * Used by PHP for example
* Server-internal script handling

Inside-out scripting allows HTML-centric development approach.

Self-processing pages are a pattern for processing form data on the same
page it is displayed on.
This is done by distinguishing between GET/POST request during script
execution.

## Example: Perl

* Approach 1
  * HTML provided in template file with placeholders
  * Separate script provides content for placeholders
* Approach 2
  * Code directly embedded in HTML with special syntax
  * Output is inserted in location of script, if requested

## Example: Java

* Inside-out scripting approach
* Before execution, JSP-to-Java transformation transforms HTML with
  embedded scripts to Java program ("Servlet") which outputs entire
  page, containing static and dynamic content.
* Generated Servlet allows ahead-of-time compilation

## Example: PHP

* Designed for inside-out scripting
* Execution environment included in web servers like apache
* Includes useful functionality for web-dev (databases, HTTP, etc)
