# Rails Sessions and Cookies
Today we'll examine ways to persist user actions across use of our app by introducing Rails sessions and cookies! 

## Our Goals
- Gain conceptual understanding of sessions and cookies

## Our Stateless World So Far 
So far in what we've been practicing with Rails, we've built user experiences based on where they are in our app, moving them through our app based on actions. 

What is state? It's the now moment that a user/app/thing exists in- what's happening right at this moment. What changes to move us into the next moment? How can we maintain state while moving through actions within our app? 

To understand how to capture a collection of now moments into a recorded user experience that happens from log in to sign out/navigate away, we'll need to understand sessions and cookies (and not the Cookie Monster variety). 

![Cookie Monster](https://media.giphy.com/media/xT0xeMA62E1XIlup68/giphy.gif)


## What are sessions?
Sessions enable the application to maintain user-specific state while users interact with the application. It keeps track of how a user is logged in on page reload and remembers everything that happens within the 'logged-in' state. As an example, sessions allow users to authenticate once and remain signed in for future requests.

To identify session information, Rails creates a cookie on the user's client (browser) that assigns a 'session hash', that is, a unique identifier placed on the user's browser that remembers everything that happens until the browser is closed. When requests are made on your app, those requests are remembered and assigned to your time online with a session id. When you restart the app, you can access this session id to return to different states. 

![Session Diagram](https://machinesaredigging.com/blog-mad/wp-content/uploads/2013/10/how_does_a_session_work-1024x724.jpg)

### How to Implement Sessions in Rails

To implement sessions in Rails: 

You can set a session in a controller action:

```rb

app/controllers/sessions_controller.rb

def create
  # ...
  session[:current_user_id] = @user.id
  # ...
end

```

And read it in another:

```rb

app/controllers/users_controller.rb

def index
  current_user = User.find_by_id(session[:current_user_id])
  # ...
end

```

Or, you can use `flash`. `flash` is a special hash (okay, a method that acts like a hash) that persists only from one request to the next. You can think of it as a session hash that self destructs after it’s opened. It’s commonly used to send messages from the controller to the view so the user can see success and failure messages after submitting forms.

```rb
class PostsController < ActionController::Base
  def create
    # save post
    flash[:notice] = "Post successfully created"
    redirect_to @post
  end

  def show
    # doesn't need to assign the flash notice to the template, that's done automatically
  end
end

show.html.erb
  <% if flash[:notice] %>
    <div class="notice"><%= flash[:notice] %></div>
  <% end %>
```

Learn more about flash [here.](https://api.rubyonrails.org/classes/ActionDispatch/Flash.html)

For more on sessions, [check out this resource](https://machinesaredigging.com/2013/10/29/how-does-a-web-session-work/) and [this one.](https://www.justinweiss.com/articles/how-rails-sessions-work/)


## What are cookies?
Cookies are key-value data pairs that are stored in the user’s browser until they reach their specified expiration date. They can be used for pretty much anything, most commonly to “bookmark” the user’s place in a web page if she gets disconnected or to store simple site display preferences.

To work with cookies, Rails gives you access to a special hash called `cookies`, where each key-value pair is stored as a separate cookie on the user’s browser.


### How to Implement Cookies in Rails

Implementing cookies involves following simple configuration in Rails, with a lot of automagic behind the scenes. Note that the use of hashes 

```rb 
# Set a simple session cookie
cookies[:user_name] = "david" 

# Set a cookie that expires in 1 hour
cookies[:login] = { :value => "XJ12", :expires => Time.now + 3600}
```

#### Reading cookies:

```rb
cookies[:user_name]  # => "david"
cookies.size         # => 2 
```


#### Deleting cookies: 
```rb
cookies.delete :user_name
```


#### All the option symbols for setting cookies are:

- value − The cookies value or list of values (as an array).

- path − The path for which this cookie applies. Defaults to the root of the application.

- domain − The domain for which this cookie applies.

- expires − The time at which this cookie expires, as a +Time+ object.

- secure − Whether this cookie is a secure cookie or not (default to false). Secure cookies are only transmitted to HTTPS servers.


#### Security? 
Curious about the security of sessions and cookies? Read up [here.](https://guides.rubyonrails.org/security.html)
---

