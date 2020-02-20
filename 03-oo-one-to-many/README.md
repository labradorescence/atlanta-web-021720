# Ruby One-To-Many Relationships

This week we're going to be talking about how to use data to create rich relationships between data in your Ruby programs.

In this lecture, we're going to establish a one-to many relationship between classes and use that relationship to complete a set of deliverables.

## SWBATs

- Review what we learned about OO Ruby
- Pseudo-code a one object to many objects relationship 
    - one object has many objects 
    - one object belongs to another object
- Practice passing custom objects as arguments to methods 
- Demonstrate single source of truth 
- Infer type of method (class or instance) through naming convention

---


## OO Ruby So Far
Object-oriented programming is a type of programming based on the concept of objects containing data, which have fields (attributes/properties) and can be operated on (through methods).

### Concept Review
Let's reinforce some of the things we went over yesterday. What are: 

Classes? 

=> Custom data type that works as a factory to provide a blueprint for instances of objects.

Objects? 

=> Things that contain data and can be manipulated through behaviors.


Instance Variables? 

=> Variables that apply to each instance of the object and can change with each instance. Usually defined within `initialize`.


Instance Methods? 

=>  Methods declared in a class that gives behaviors to instances of a class.


Class Variables? 


=> A variable that is accessible to the whole class- has a class scope.


Class Methods? 


=> A method that is accessible to the whole class- has a class scope.


Self

=> The object being self-aware, knowing about itself.


>Remember that classes are a blueprint, objects are the instances created from this blueprint. 

>Instance variables give properties to an object, and instance methods provide functionality to an instance of a class (object).

>Class variables give properties to an entire class, and class methods provide functionality to the class.

>Self contextually refers to the current object that is receiving the current message. [Here's](https://airbrake.io/blog/ruby/self-ruby-overview) a good resource on Self to read for more info.


`attr_reader`, `attr_writer`, `attr_accessor`? 

=>  attr_reader: getter method that allows users to read content.

=>  attr_writer: setter method that allows users to write content.

=>  attr_accessor: getter and setter method that allows both read and write access.


>Remember that the usage of macros is preferred over the explicit definition of setter and getter methods, unless you need to customize the implementation of a method.

#### Using `attr_accessor`

```rb
class School 
    attr_accessor :name 

    def initialize(name)
        @name = name
    end
end

class Student
    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
    end
end

Bayside = School.new("Bayside High")
Zack = Student.new("Zack Morris", "16")
```

What sort of relationship does school have to student?

---
## Intro to One-to-Many Relationships
Just like in real life, two objects can be associated to each other by design or function. How do we create these relationships in Ruby?


### New Vocabulary Words

- Model: a class whose primary responsibility is to store data. 

- Domain: the subject matter of the 'problem' you're looking to solve.

- Domain Modeling: Creating models for your domain to represent real or abstract ideas (e.g., Learn's domain model includes modules, cohorts, assignments as well as their relationships)

- Class Method: method that resides at the class level- only exists in the class where defined.

- Class Variable: variable that resides at the class level.  

- Single Source of Truth: idea that info is defined once and should be contained where defined.

- Relationships: how models (classes) and associated data are connected to each other.

- One-to-Many Relationship: A relationship describing a single model that contains or keeps track of other models.


### Examining Relationships Between Models

Let's talk about examples of models, domains, relationships, and a one-to-many relationship. Using [AWW](https://awwapp.com/#), let's pseudocode out some relationships. 

- One to many relationship examples: 

- teacher and courses 
- mother and children
- doctor and patients

=> boss to employee- a boss has many employees, employees belong to boss (not really tho)

league to team- a league has many teams, teams belong to one league (NBA, NFL)


>The `has-many`/`belongs-to` relationship is commonly seen. The `belongs-to` model should always know about the `has-many` model. 

---

## Building a One-To-Many Relationship

In order to build out a relationship, it's good to pseudocode and talk through how the models will connect before touching code.

### Creating a Process for Domain Problems

Here's a handy process to follow: 

- talk out loud about the real-life abstraction that you are attempting to solve for
- draw out your models physically 
- pseudocode your classes to understand what data is shared between models in the relationship
- write out the logic connecting your models
- test, debug, and refactor

### Working Through Deliverables

Often times you'll get a set of deliverables that you need to work through in order to complete a task. Take each step-by-step, paying attention to the relationship you're building and how your models are built around the domain you're working under.

---

## Deliverables 

* Create a User class. The class should have these methods:
  * `User#initialize` which takes a username
  * `User#username` reader method
  * `User#tweets` that returns an array of Tweet instances
  * `User#post_tweet` that takes a message, creates a new tweet, and adds it to the user's tweet collection

* Create a Tweet class. The class should have these methods:
  * `Tweet#message` that returns a string
  * `Tweet#user` that returns an instance of the user class
  * `Tweet.all` that returns all the Tweets created.
  * `Tweet#username` that returns the username of the tweet's user

