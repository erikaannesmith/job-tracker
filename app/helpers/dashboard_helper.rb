module DashboardHelper

  def interest_range_count
    interest_ranges = [[0..10],[11..20],[21..30],[31..40],[41..50],[51..60],[61..70],[71..80],[81..90],[91..100],[101..5000]]
    count_of_ranges = interest_ranges.map do |range|
      Job.where(level_of_interest: range).count
    end
    interest_ranges.zip(count_of_ranges)
  end

  def location_count
    jobs = Job.all.group_by { |job| job.city }
    jobs.map { |city,job| [city,job.count] }
  end

  def top_companies_by_interest
    jobs = Job.group(:company_id).average(:level_of_interest)
    jobs.sort_by {|k,v| v }.reverse.shift(3)
  end

end
