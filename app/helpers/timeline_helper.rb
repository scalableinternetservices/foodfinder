module TimelineHelper
  def cache_key_for_timeline_deal(deal)
    "deal/#{deal.id}/#{deal.updated_at}"
  end
  
  def cache_key_for_timeline_deal_table
    "timeline_deal_table/#{User.maximum(:updated_at)}/#{Deal.maximum(:updated_at)}"
  end
end
