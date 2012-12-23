class MinecraftAccountVerifier
  require 'net/http'
  require 'uri'

  SKINS_S3_BUCKET = 's3.amazonaws.com'.freeze

  attr_reader :error

  # Public: verify an account as a true Minecraft account this user has access to.
  #
  # username - both the username for this service and their in-game identity
  def initialize(username)
    @username = username
  end

  def authentic?
    if user_skin
      return true if skin_difference == 0.0

      @error = "Skin does not match verification skin. Please wait a minute or try uploading the skin again. (#{skin_difference}% different)"
      false
    else
      @error = 'Your skin was not found. Please note that your username is case sensitive'
      false
    end
  end

  private
  def skin_difference
    diffs = []
    user_skin.height.times do |y|
      user_skin.row(y).each_with_index do |pixel, x|
        diffs << [x, y] unless pixel == verification_skin[x, y]
      end
    end
    diffs.length.to_f / verification_skin.pixels.length * 100
  end

  def user_skin
    @user_skin ||=
      Net::HTTP.start(SKINS_S3_BUCKET) do |http|
        response = http.get("/MinecraftSkins/#{@username}.png")
        if response.code == '200'
          datastream = ChunkyPNG::Datastream.from_blob(response.body)
          return ChunkyPNG::Image.from_datastream(datastream)
        end
      end
  end

  def verification_skin
    @verification_skin ||=
      ChunkyPNG::Image.from_file(Rails.root.join('public/verification_skin.png'))
  end
end
