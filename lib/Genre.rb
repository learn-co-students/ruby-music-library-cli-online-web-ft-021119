class Genre

    @@all = []
    def initialize(name)
      @name = name
    end

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      genre
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def name
      @name
    end

    def name=(name)
      @name = name
    end

    def save
      @@all << self
    end
end
