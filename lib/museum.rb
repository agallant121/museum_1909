class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
      @exhibits.map do |exhibit|
         if patron.interests.include?(exhibit.name) #stuck on this from 9:50 -10:45, whoops.
           exhibit
         end
      end
  end
end
