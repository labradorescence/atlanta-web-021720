# Rails Associations
Now that we've learned about how to start building an app with Rails, we'll dive into the details that make our apps cleaner and more streamlined.

## Our Goals

- Build out and form an association with another model in our Doctors app
- Add a `collection select` form helper to our app to illustrate our association


## A Note on Paths

From the Rails Guides: 

Creating a resourceful route will expose a number of helpers to the controllers in your application. In the case of resources `:photos`:

```rb
photos_path returns  /photos
new_photo_path returns  /photos/new
edit_photo_path(:id) returns  /photos/:id/edit (for instance, edit_photo_path(10) returns  /photos/10/edit)
photo_path(:id) returns  /photos/:id (for instance, photo_path(10) returns /photos/10)
```

Each of these helpers has a corresponding _url helper (such as photos_url) which returns the same path prefixed with the current host, port, and path prefix.

Path helper assistance can be found by using the `rails routes` command in your Terminal or by following `http://localhost:3000/rails/info/routes`.



## Association Refresher

In Rails, an association is a connection between two Active Record models. 

Associations are implemented using macro-style calls, so that you can declaratively add features to your models. 

For example, by declaring that one model `belongs_to` another, you instruct Rails to maintain `Primary Key-Foreign Key` information between instances of the two models, and you also get a number of utility methods added to your model.

For more information about Associations, visit the [Rails Guide](https://guides.rubyonrails.org/association_basics.html).




## Using Collection Select 

`collection_select` is a form helper that generates a dropdown menu where users can select an option from the dropdown.

It's typically written like this: 

```rb
collection_select(object, method, collection, value_method, text_method)
```

and generates a form that looks like this: 

```rb
<select name="object[method]" id="object_method">
  <option value="value_method">text_method</option>
  <option value="value_method">text_method</option>
```

For example, for a song resource that allows users to select genres: 

```rb
<%= form_for @song do |f| %>
  <%= f.collection_select :genre_id, Genre.all, :id, :name %>
  <%= f.submit %>
<% end %>
```

produces: 

```rb
<select name="song[genre_id]" id="song_genre_id">
  <option value="1">Blues</option>
  <option value="2">Classic Rock</option>
  <option value="3">Country</option>
  <option value="4">Dance</option>
  <option value="5">Disco</option>
```

For a really good breakdown of `collection_select`, check out this [Medium article.](https://medium.com/@theresamorelli/collection-select-what-the-heck-4e1cabc4be4b)


## Our Process 

Remember that with `Convention over Configuration`, the best practice is to follow a process. Here's the process that we talked about last week, that I'll be following to build our model: 

- Build Model 
- Create Migration 
- Run Migration 
- Check Schema
- Test 
- Build Association 
- Test
- Build Controller Routes 
- Build Associated Views 
- Test 



