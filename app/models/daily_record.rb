class DailyRecord < ApplicationRecord
  include ActiveModel::Dirty

  before_save :calculate_averages, if: -> { male_count_changed? || female_count_changed? }

  private

  def calculate_averages
    self.male_avg_age = User.where(gender: 'male').average(:age)
    self.female_avg_age = User.where(gender: 'female').average(:age)
  end
end
