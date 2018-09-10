#Action Cable seamlessly integrates WebSockets with the rest of your Rails application. It allows for real-time features to be written in Ruby in the same style and form as the rest of your Rails application, while still being performant and scalable. It's a full-stack offering that provides both a client-side JavaScript framework and a server-side Ruby framework. You have access to your full domain model written with Active Record or your ORM of choice.
module ApplicationCable
  #Connections are instances of ApplicationCable::Connection. In this class, you authorize the incoming connection, and proceed to establish it if the user can be identified.
  class Connection < ActionCable::Connection::Base
  end
end
