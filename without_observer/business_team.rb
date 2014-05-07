class BusinessTeam
  attr_accessor :live_deals, :in_pipeline_deals

  def initialize
    @live_deals = 0
    @in_pipeline_deals = 0
  end

  def update(deal)
    if deal.state == "new"
      @in_pipeline_deals += 1
    elsif deal.state == "complete"
      @live_deals += 1
      @in_pipeline_deals -= 1
    end
  end
end