
class Museum

  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recmd_exhib = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        recmd_exhib << exhibit
      end
    end
    return recmd_exhib
  end
end
