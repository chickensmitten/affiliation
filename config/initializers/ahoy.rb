class Ahoy::Store < Ahoy::Stores::ActiveRecordStore
  # customize here
  Ahoy.visit_duration = 2.minutes
  
  def track_visit(options)
    super do |visit|
      visit.follower = visit_properties.landing_params["follower"]
    end
  end
end
