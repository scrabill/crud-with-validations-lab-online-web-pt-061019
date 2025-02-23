class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'Nope'
  }
  validates :released, inclusion: {in: [true, false]}

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end



  # validates :title, :artist_name, presence: true
  # validates :release_year, presence: true
    # if: [released presence: true],


  # class Computer < ApplicationRecord
  #   validates :mouse, presence: true,
  #                     if: [Proc.new { |c| c.market.retail? }, :desktop?],
  #                     unless: Proc.new { |c| c.trackpad.present? }
  # end

end
