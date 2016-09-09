class World
  ALL = if Rails.env.production?
          {
            '182702a7-ea3f-41de-a2d3-c046842d5e74' => 'Abydos',
            '197e2c4f-2fd6-464a-8754-53b24d9f7898' => 'Isolde',
            '44f4b133-a646-461a-a14a-5fd8c8dbc59c' => 'Tjikko',
            '63a68417-f07f-4cb5-a9d8-e5e702565967' => 'Tigrillo',
            '7120b7a6-dd21-468c-8cd7-83d96f735589' => 'Padzahr',
            '7f03aa4d-833c-4b0c-9d3b-a65a5c6eada0' => 'Ulca Felya',
            'a358b10c-7041-40c5-ac5e-db5483a9dfc2' => 'Eilon',
            'a72e4777-ad62-4e3b-a4e0-8cf2d15147ea' => 'Rokko Steppe',
            'a7cbf239-6c11-4146-a715-ef0a9827b4c4' => 'Drakontas',
            'b25abb31-fd1e-499d-a5b5-510f9d2ec501' => 'Volans',
            'de730958-fa83-4e73-ab7f-bfdab8e27960' => 'Naunet',
            'fc891b9e-4b20-4c8d-8f97-7436383e8105' => 'Sheol'
          }
        else
          {'world' => 'World'}
        end.freeze

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
