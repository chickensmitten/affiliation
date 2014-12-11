class Ahoy::Store < Ahoy::Stores::ActiveRecordStore
  # customize here
  Ahoy.visit_duration = 2.minutes
  
  def track_visit(options)
    super do |visit|
      relation = visit.landing_page.split("/").last.split("_")
      follower = (relation.count == 2) ? relation.last : ""
      leader = (relation.count == 2) ? relation.first : ""
      visit.follower_id = User.where("username = ?",follower).try(:first).try(:id) if follower.present?
      visit.leader_id = User.where("username = ?",leader).try(:first).try(:id) if leader.present?
    end
  end
end
