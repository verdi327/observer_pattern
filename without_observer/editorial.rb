class Editorial
  attr_accessor :todo, :urgent, :completed

  def initialize
    @todo = 0
    @urgent = 0
    @completed = 0
  end

  def update(deal)
    if deal.state == "new"
      @todo += 1
    elsif deal.state == "photos_complete"
      @urgent += 1
      @todo -= 1
    elsif deal.state == "copy_complete"
      @urgent -= 1
      @completed += 1
    end
  end
end