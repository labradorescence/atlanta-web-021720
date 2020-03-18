# Rails Forms and Validations

Continuing our study of Rails, we'll get additional practice building Rails apps from scratch while introducing a few new tools to use when building. 


## Goals 
- Build an app with two models from scratch, following process
- Learn about flash hash, error handling, and validations



## Sending Messages and Handling Errors 

Rails takes care of a lot of things for us automagically, and error handling and messaging is no exception. 



### The Flash Hash 

The flash hash is a way to share communication with users of your app after they've performed an action. Before a redirect or in the instance of a form for example, you can set a key - value pair to let users know a quick message, with the value set to the message you would like to display.

```rb
flash[:message] = "Put your message here"
```

Here's a few example messages:

“Password changed correctly” (confirmation)
“User not found” (error)

You set these flash messages in your controllers, then you render them in your views. Your users can then act accordingly! By default, you have both `alert` and `notice` available to you, and they are used like this: 

```rb
flash.alert = "User not found."

OR 

flash[:alert] = "User not found."
```

And it can be used in controller actions like this: 

```rb
# allows to redirect then send notice in one step
redirect_to :books_path, notice: "Book not found"
```

There are many variations of usage for the flash hash. For more information, [check out this resource.](https://www.rubyguides.com/2019/11/rails-flash-messages/)



### Error Handling in Rails

Ruby's default exception handling is to terminate the program in the event of an exception, but what happens if you want to handle errors in a different way? 

Exception handlers are blocks of code that are called if an exception occurs in the execution of another block of code in your program.

Ruby has two methods, `raise` and `rescue`, that allows you to handle errors.  


#### Raise 
When you `raise` an exception, you stop the normal flow of the program, and execute the code that deals with handling an error. This code can either deal with the error in some way, or terminate the program. 

#### Rescue 
If you provide a `rescue` clause in your error handler, you can choose how to deal with the exception; without it, the program will simply terminate.

Here's an example of `raise` and `rescue` used: 

```rb
def handle_exception
    puts 'Lalala, our app is running without errors.'
    raise 'Oh no, a error has occurred.'
  rescue
    puts 'Hooray the error has been rescued instead of terminating the program.'
end

handle_exception
```

For more information about error handling, [this is a good resource.](https://rollbar.com/blog/ruby-exception-handling-guide/#basic-ruby-error-handling)



## Validations in Rails
Validations are used to ensure that only valid data is saved into your database. For example, it may be important to your application to ensure that every user provides a valid email address and mailing address. 

Model-level validations are the best way to ensure that only valid data is saved into your database. They are database agnostic, cannot be bypassed by end users, and are convenient to test and maintain. 

Here's an example of a validation in action: 

```rb
class Person < ApplicationRecord
  validates :name, presence: true
end
 
Person.create(name: "John Doe").valid? # => true
Person.create(name: nil).valid? # => false
```

### Triggering Validations 

The following methods trigger validations, and will save the object to the database only if the object is valid:

create
create!
save
save!
update
update!

The bang versions (e.g. save!) raise an exception if the record is invalid. The non-bang versions don't: save and update return false, and create just returns the object.



### Handling Errors through validations
After Active Record has performed validations, any errors found can be accessed through the errors.messages instance method, which returns a collection of errors. By definition, an object is valid if this collection is empty after running validations.

Note that an object instantiated with new will not report errors even if it's technically invalid, because validations are automatically run only when the object is saved, such as with the create or save methods.

```rb
class Person < ApplicationRecord
  validates :name, presence: true
end
 
>> p = Person.new
# => #<Person id: nil, name: nil>
>> p.errors.messages
# => {}
 
>> p.valid?
# => false
>> p.errors.messages
# => {name:["can't be blank"]}
 
>> p = Person.create
# => #<Person id: nil, name: nil>
>> p.errors.messages
# => {name:["can't be blank"]}
 
>> p.save
# => false
 
>> p.save!
# => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank
 
>> Person.create!
# => ActiveRecord::RecordInvalid: Validation failed: Name can't be blank
```

For more on validations, [visit the Rails guides.](https://guides.rubyonrails.org/active_record_validations.html) 


## Deliverables and Process 

We'll be building an app from scratch today using some of our new tools, and will be following this process: 

- Draw out design of app 
- Check out boilerplate if necessary 
- Build a model
- Create a migration
- Run the migration
- TEST 
- Build Association
- Create and run seed data with rake db:seed 
- TEST
- Create controller actions/routes
- TEST
- Create views
- TEST 


PetRescueApp 

Owner 
- name
- age


Pet 
- name
- breed


one-to-many: 

Owner has many pets 
Pet belongs to owner 

Foriegn key: on pets, `owner_id`


