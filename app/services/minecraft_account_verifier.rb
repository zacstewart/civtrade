class MinecraftAccountVerifier
  require 'net/http'
  require 'uri'

  AUTH_URI = URI.parse('https://login.minecraft.net/').freeze
  CLIENT_VERSION = 13

  attr_reader :error

  # Public: verify an account as a true Minecraft account this user has access to.
  #
  # login    - the username or email used to log into the Minecraft client
  # username - both the username for this service and their in-game identity
  # password - password used to log into the Minecraft client
  def initialize(login, username, password, http_requester=Net::HTTP)
    @login = login
    @username = username
    @password = password
    @http_requester = http_requester
  end

  def authentic?
    response = login.body

    if response =~ username_regex
      true
    else
      @error = login.body.chomp
      false
    end
  end

  private
  def username_regex
    Regexp.new(@username, 'i')
  end

  def request_parameters
    {
      'user' => @login,
      'password' => @password,
      'version' => CLIENT_VERSION
    }
  end

  def login
    request = Net::HTTP::Post.new(AUTH_URI.request_uri)
    request.set_form_data(request_parameters)

    http = Net::HTTP.new(AUTH_URI.host, AUTH_URI.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    http.request(request)
  end
end
