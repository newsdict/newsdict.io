require 'webmock'
include WebMock::API

WebMock.enable!

# Copy the modules from twitter gem

def a_delete(path)
  a_request(:delete, Twitter::REST::Request::BASE_URL + path)
end

def a_get(path)
  a_request(:get, Twitter::REST::Request::BASE_URL + path)
end

def a_post(path)
  a_request(:post, Twitter::REST::Request::BASE_URL + path)
end

def a_put(path)
  a_request(:put, Twitter::REST::Request::BASE_URL + path)
end

def stub_delete(path)
  stub_request(:delete, Twitter::REST::Request::BASE_URL + path)
end

def stub_get(path)
  stub_request(:get, Twitter::REST::Request::BASE_URL + path)
end

def stub_post(path)
  stub_request(:post, Twitter::REST::Request::BASE_URL + path)
end

def stub_put(path)
  stub_request(:put, Twitter::REST::Request::BASE_URL + path)
end

# Change path `fixtures` to `fixtures/files/twitter`
def fixture_path
  File.expand_path('fixtures/files/twitter', __dir__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def capture_warning
  begin
    old_stderr = $stderr
    $stderr = StringIO.new
    yield
    result = $stderr.string
  ensure
    $stderr = old_stderr
  end
  result
end