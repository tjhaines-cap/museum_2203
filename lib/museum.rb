
class Museum

  attr_reader :name, :exhibits, :patrons, :revenue

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @patrons_of_exhibits = {}
    @revenue = 0
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

  def admit(patron)
    @patrons << patron
    possible_exhibits = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        if patron.spending_money > exhibit.cost
          possible_exhibits << exhibit
        end
      end
    end
    possible_exhibits.sort!{|a, b| b.cost <=> a.cost}
    possible_exhibits.each do |exhibit|
      if patron.spending_money >= exhibit.cost
        patron.spending_money -= exhibit.cost
        @revenue += exhibit.cost
      end
    end
  end

  def patrons_by_exhibit_interest
    patrons_by_interest_hash = {}
    @exhibits.each do |exhibit|
      patrons_by_interest_hash[exhibit] = []
      patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          patrons_by_interest_hash[exhibit] << patron
        end
      end
    end
    return patrons_by_interest_hash
  end

  def ticket_lottery_contestants(exhibit)
    lottery_cont = []
    @patrons.each do |patron|
      if patron.interests.include?(exhibit.name)
        if patron.spending_money < exhibit.cost
          lottery_cont << patron
        end
      end
    end
    return lottery_cont
  end

  def draw_lottery_winner(exhibit)
    lottery_contestants = ticket_lottery_contestants(exhibit)
    winner = nil
    if lottery_contestants.length > 0
      random_num = rand(0..(lottery_contestants.length-1))
      winner = lottery_contestants[random_num].name
    end
    return winner
  end


end
