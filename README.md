# Ruby on Rails assessment

## 1. Technologies used:

- Docker
- Ruby 3.2.2
- Rails 7.1.1
- PostgreSQL
- ElasticSearch

## 2. Structure

![db structure](docs/swivel-rails-db.drawio.png)

This assessment has been broken into a list of tasks, which has been listed below. MVC pattern has been used as the primary pattern the assessment is developed on, and provides an JSON based API. Which supports nested resources. Elasticsearch would be used to implement a standaized search. OOP concepts are used as the core. 

## 3. Tasks

1. [x] Build docker container which includes the above stack
    1. Setup initial ruby image based container
    2. Integrate PostgreSQL
    3. Integrate ElasticSearch

2. [x] Develop `verticals`
    1. Develop model
    2. Develop controller / API end points
    3. specs

3. [x] Develop `categories`
    1. Develop model
    2. Develop controller / API end points
    3. specs

4. [x] Develop `courses`
    1. Develop model
    2. Develop controller / API end points
    3. specs

5. [x] Integrate ElasticSearch to `search#search` 

6. [x] Update seed

7. [ ] Implement authentication layer
    1. setup devise with tokens for authentication
    2. authorize API
    3. configure for oauth
    4. setup a provider

## 4. Setup

Since docker has been configued to setup the enviorement use the following command:

```docker-compose up --build```

## 5. Answers for future implementations

### How does your solution perform? 

The code and the Database has been optimized and where necessary indexes are created. However there are more oppertunities to improve the solution such as refactor the `author` into a seperate class. 

### How does your solution scale?

Currently the Database has been developed to allow indexing and with Elasticsearch it will use NoSQL to improve the search. If the solution is to handle large amount of imformation, the hardware layer can be scaled to improve the speed. To that point since docker has been implemented, with Kubernetes the scalling can be automated.


### What would you improve next?
1. Create an `author` model and move the author out of the `course` model
2. `course` could have multiple `categories`
3. Optimize serializer to only include required fields
4. Optimize Elasticsearch, so that Enums such as the state would be properly worded.