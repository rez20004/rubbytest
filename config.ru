require 'rack'
require 'rack/lobster'

map '/health' do
  health = proc do |env|
    [200, { "Content-Type" => "text/html" }, ["1"]]
  end
  run health
end

map '/lobster' do
  run Rack::Lobster.new
end

map '/headers' do
  headers = proc do |env|
    [200, { "Content-Type" => "text/plain" }, [
      env.select {|key,val| key.start_with? 'HTTP_'}
      .collect {|key, val| [key.sub(/^HTTP_/, ''), val]}
      .collect {|key, val| "#{key}: #{val}"}
      .sort
      .join("\n")
    ]]
  end
  run headers
end

map '/' do
  welcome = proc do |env|
    
<section class='container'>

app = lambda {|env| [200, {'Content-Type': 'text/html'}, 'Hello World']}

</section>

  end
  run app
end
