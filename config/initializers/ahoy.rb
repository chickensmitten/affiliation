class Ahoy::Store < Ahoy::Stores::ActiveRecordStore
  # customize here
  Ahoy.visit_duration = 2.hours
  
  def track_visit(options)
    super do |visit|      
      relation = visit.landing_page.split("/").last.split("_")

      if relation.count == 2
        follower = (relation.count == 2) ? relation.last : ""

        if controller == "users"
          leader = (relation.count == 2) ? relation.first : ""
        else
          post_id = (relation.count == 2) ? relation.first : ""
          leader = Post.where("id = ?",post_id).try(:first).try(:user_id) if post_id.present?
        end
        visit.follower_id = User.where("username = ?",follower).try(:first).try(:id) if follower.present?
        visit.leader_id = User.where("id = ?",leader).try(:first).try(:id) if leader.present?
        if visit.follower_id == visit.leader_id
          return false
        end
      else
        return false
      end
    end
  end
end
