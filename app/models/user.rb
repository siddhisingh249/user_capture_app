class User < ApplicationRecord
  after_destroy :update_daily_record_counts

  private
  
  def update_daily_record_counts
    daily_record = DailyRecord.find_or_initialize_by(date: Date.today)

    daily_record.male_count = User.where(gender: 'male').count
    daily_record.female_count = User.where(gender: 'female').count
    daily_record.save
  end
end
