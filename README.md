Welcome to spring-boot-postgres Library project
Pre requisites
Java Java 17.0.3 Maven 4.0.0 PostGreSql running locally on PG 14
Intellij community version to run the sprinboot app or also possible from linux terminal through mvn

Postgres Instance Configuration
In order to use your instance please update the [ Database Configuration Section ] section in /library application /java/Library-MainService/src/main/resources/application.properties

#
# [ Database Configuration Section ]
#
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/library_dev_db
    username: postgres
    password: 123456789
    platform: POSTGRESQL
  
server:
  port: 8080
  
#
# [ Other Configuration Attributes ]
#
Run Application Locally
Run the Springboot app from intellij 


Load Sample Data
A local postgres database has to be created with name library_dev_db
The schema can be loaded in the db from the SCHEMA.sql fiel in the root directory. 
Then the data can be dumped in the db by the db dump provided in the root folder by name : dump-library_dev_db-202312111125.sql


Proposed Architecture diagram for the whole microservice considering this library api to be a part of the mainService: 
Architechture diagram Library.opnier.com.png   attached in root folder


Invoke Application
run the springboot app locally 
invoke apis through psotman 
to make GET requests, use tools like POSTMAN or curl : 

a) returns all users who have actually borrowed at least one book
http://localhost:8080/MainService/user/borrower

b) returns all non-terminated users who have not currently borrowed anything
http://localhost:8080/MainService/user/nonReader

c) returns all users who have borrowed a book on a given date
http://localhost:8080/MainService/user/usersWithBorrowDate?dateString=2008-05-14

d) returns all books borrowed by a given user in a given date range
http://localhost:8080/MainService/book/getCustomBooks
Body: 
{
  "borrowedFrom": "2020-01-01",
  "borrowedTo": "2022-01-01",
  "userUUID": "d8bb6a3e-ef7f-4bfb-8e4b-9d292bbd7a87"
}

e) returns all available (not borrowed) books
http://localhost:8080/MainService/book/getAvailableBooks
