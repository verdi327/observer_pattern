require_relative "photo_team"
require_relative "editorial"
require_relative "business_team"
require_relative "deal"

class Pipeline
  attr_accessor :deals

  def initialize
    @deals = []
  end

  def add(deal)
    @deals << deal
    inform_photo_team(deal)
    inform_editorial_team(deal)
    update_biz_metrics(deal)
    self
  end

  def mark_photos_complete(deal_title)
    deal = find_deal(deal_title)
    deal.state = "photos_complete"
    inform_photo_team(deal)
    inform_editorial_team(deal)
  end

  def mark_copy_complete(deal_title)
    deal = find_deal(deal_title)
    deal.state = "copy_complete"
    inform_editorial_team(deal)
  end

  def ready_for_primetime(deal_title)
    deal = find_deal(deal_title)
    deal.state = "complete"
    update_biz_metrics(deal)
  end

  private

  def find_deal(deal_title)
    deals.detect {|deal| deal.title == deal_title}
  end

  def photo_team
    @photo_team ||= PhotoTeam.new
  end

  def editorial
    @editorial ||= Editorial.new
  end

  def biz_team
    @biz_team ||= BusinessTeam.new
  end

  def inform_photo_team(deal)
    photo_team.update(deal)
  end

  def inform_editorial_team(deal)
    editorial.update(deal)
  end

  def update_biz_metrics(deal)
    biz_team.update(deal)
  end
end