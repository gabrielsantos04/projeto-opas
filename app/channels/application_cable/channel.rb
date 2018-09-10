#Action Cable seamlessly integrates WebSockets with the rest of your Rails application. It allows for real-time features to be written in Ruby in the same style and form as the rest of your Rails application, while still being performant and scalable. It's a full-stack offering that provides both a client-side JavaScript framework and a server-side Ruby framework. You have access to your full domain model written with Active Record or your ORM of choice.
module ApplicationCable
  #A channel encapsulates a logical unit of work, similar to what a controller does in a regular MVC setup. By default, Rails creates a parent ApplicationCable::Channel class for encapsulating shared logic between your channels.
  class Channel < ActionCable::Channel::Base
  end
end
