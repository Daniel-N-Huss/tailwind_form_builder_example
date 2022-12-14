class Adventurer < ApplicationRecord
  validates_presence_of :name, :city
  validate :good_alignment

  EVIL_ALIGNMENTS = ["Lawful Evil", "Neutral Evil", "Chaotic Evil"].freeze
  GOOD_ALIGNMENTS = ["Lawful Good", "Neutral Good", "Chaotic Good", "Lawful Neutral", "Neutral", "Chaotic Neutral"].freeze
  ALIGNMENTS = (GOOD_ALIGNMENTS + EVIL_ALIGNMENTS).freeze

  def good_alignment
    if EVIL_ALIGNMENTS.include?(alignment)
      errors.add(:alignment, "No Evil Characters")
    end
  end
end
