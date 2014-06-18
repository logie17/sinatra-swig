sinatra-swig
============

# Synopsis

  ```ruby
    set :api_key, 'bar'
    set :service_url, 'http://baz'
    get "/" do 
      content_type "text/html"
      return render("./foo.html", { :foo => 'bar' })
    end
  ```
# Licencse
Copyright (c) 2014 Logan Bell and Shutterstock Inc (http://shutterstock.com). All rights reserved. This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.
