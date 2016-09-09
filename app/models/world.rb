class World
  ALL = {'world' => 'World'}.freeze
  UNKNOWN_WORLD = 'Unknown World'.freeze

  attr_reader :name

  def self.all
    ALL
  end

  def self.ids
    ALL.keys
  end

  def self.find(uuid)
    new(all.fetch(uuid, UNKNOWN_WORLD))
  end

  def initialize(name)
    @name = name
  end
end
