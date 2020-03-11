# Sinatra Forms and Associations

We're continuing in our journey to Rails with practice in Sinatra with forms and associations. In our last lecture, we talked about RESTful routes and how to start planning our app architecture to match our domain problem and user flow. Today we'll work through forms and add associations with Active Record to further build out our FriendsList.

## Our Goals

- Understand the params hash in a deeper way
- Build out and see the association between two models happen in Sinatra
- Review how ActiveRecord methods can help us express associations more fully

---

### Some Helpful Definitions: 

- Substitution Tag: evaluates Ruby code and then displays the results into the view (.erb file). It opens with `<%=` and closes with `%>`.

- Scripting Tag: opens with `<%` and close with `%>`. They evaluate –– but do not actually display –– Ruby code.

- Mass Assignment: a feature of Rails which allows an application to create a record from the values of a hash.

- Params Hash: a collection of data that comes through your application from a request

---

### More on the Params Hash

`params` is a hash of key/value pairs assigned to a getter method called `params`. It is a hash that Sinatra makes available for you in your route blocks, and it will automatically include relevant data from the request.

```rb
get "/friends/:name" do
  "Hello #{params["name"]}!"
end
```

This route specifies a path that is a pattern: the last part of the path starts with a colon :. This tells Sinatra that we’d like to accept any string here, and that we’d like to call this string name.

Sinatra adds the key "name" to the params hash, and sets the given string from the path (i.e. from the URL) to it.

When you point your browser to the URL 'friends/Aeryn' your application will say “Hello Aeryn!”, when you go to 'friends/Aiyanna' your application will say “Hello Aiyanna!”, and so on.


### A little deeper...

The params hash is set on the `ActionController::StrongParameters` class and returns the instance variable `@_params`, which is an instance of the `ActionController::Parameters` class. 

The `StrongParameters` class is one that gives us security and control over which parameters are allowed/required. We have access to `params` because our controllers are descendants of `ActionController::StrongParameters` and inherit all of its instance methods.

When users send data to your app, they can accomplish it in three ways: 

1. Using a query parameter ("example.com/?q=love")
2. Submitting a form ("/users/sign_in")
3. Within the URL itself ("/books/1")

Through these HTTP requests, form & URL query data is sent that can be accessed by calling `params` within your controller's actions. 

#### Here's an example: 

To send a hash you include the key `name` inside the brackets:

```rb
<form accept-charset="UTF-8" action="/users" method="post">
  <input type="text" name="user[name]" value="Auction" />
  <input type="text" name="user[phone]" value="201-867-5309" />
  <input type="text" name="user[address][postcode]" value="07001" />
  <input type="text" name="user[address][city]" value="New Jersey" />
</form>
```

When this form is submitted, the value of params[:user] will be:

```rb
{ 
"name" => "Auction", 
"phone" => "201-867-5309", 
"address" => { "postcode" => "07001", "city" => "New Jersey" } 
}
```


[Learn more about where the params method comes from.](https://medium.com/launch-school/params-in-rails-where-do-they-come-from-b172cdb46eb4)

---

### Deliverables
Today, we are tasked with building a new model and forming an association between that model and `friends`. 

Next, we need to perform CRUD operations that define the relationship between these two models. 


