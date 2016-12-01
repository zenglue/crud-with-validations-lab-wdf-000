class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :release_year, presence: true, if: :released?
  validate :release_year_valid?

  def release_year_valid?
    if release_year.to_i > Time.now.year
      errors.add(:release_year, "release year is in the future")
    end
  end
end
