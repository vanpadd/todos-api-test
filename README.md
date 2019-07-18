# todosapitest

This repository is a POC on using Karate DSL as a Rest API test automation tool to test the todos Rest API as defined in [JSONPlaceholder](https://jsonplaceholder.typicode.com/) 

### What does the framework do and how does it work?

Having had experience with other toolsets (i.e. Rest Assured, Mocha), I used this opportunity to look at the open source tool Karate DSL for the purposes of this exercise. 
Although I have dabbled with this framework some years ago, it was at the time still in its infancy. 
It has matured over the years and the community surrounding it has also grown in support of this framework. 
It was originally popularized by the likes of Cucumber such that it can be written in BDD syntax. 
This framework caters for a combination of API test automation, mocks and performance testing into one. 
It is easy to use for non-programmers, and unlike Cucumber, there is no need to implement step definitions known as the ‘glue’.

Apart from its support for JSON & XML assertions, embedding GraphQL, built-in mocks and performance testing, 
the key benefits that really resonate with me are the fact that you can easily configure 
(built-in support for switching environment config) and run tests in parallel for speed, 
which as a result reduces Lead time as part of a deployment pipeline. 
Secondly, the validation engine can perform a ‘smart compare’ (deep-equals) such that you can compare, 
traverse and match deeply nested objects. Thirdly, you’re able to extract multiple data elements for reuse in 
subsequent HTTP calls with ease. And lastly, in terms of test reporting it integrates nicely with third party 
cucumber reporting library which is in line with existing reporting used as part of a CI pipeline.

### Steps in producing the tests

* Define test scope as per the CRUD requirements. 
* Follow the BDD approach by creating user stories to showcase the scenarios, then incorporating a set of acceptance criteria’s. 
* Based on the above generate a set of high level test scripts in Gherkin that is understandable for everyone. 
* Run the tests such that it fails initially, commit, then refactor the test scripts until it passes. 
* Apply any necessary code/feature abstractions to remove repeatability/duplication.
* Ensure the scenarios are agnostic and data driven to allow for scalability.

### Lessons and challenges

One of the key takeaways by having used this API test framework is its ease in setup and use (at least in the preliminary use of basic API testing). 
The strength of where API test frameworks should reside is in the flexibility and scalability of asserting response data, 
Karate does this very well i.e. floating point precision, numeric assertions work just as you expect and it caters for 
matching deeply nested objects. One of the interesting challenges was to figure out ways to use JsonPath to extract JSON 
arrays/chunks and save them to variables for use in later steps. Further challenges as part of the experimentation process 
was to call a custom java method and integrate it as part of a scenario (as depicted in the last scenario).

### Getting started

Karate requires Java 8 (at least version 1.8.0_112 or greater) and then either Maven, Gradle, Eclipse or IntelliJ to be installed.

#### To run the test using Maven

```
mvn clean test
```
