class PhotoTeam
  attr_accessor :todo, :completed

  def initialize
    @todo = 0
    @completed = 0
  end

  def update(deal)
    if deal.state == "new"
      @todo += 1
    elsif deal.state == "photos_complete"
      @todo -= 1
      @completed += 1
    end
  end
end