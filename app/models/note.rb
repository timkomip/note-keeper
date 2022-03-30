class Note < ApplicationRecord
  has_and_belongs_to_many :tags
  belongs_to :user, default: -> { Current.user }

  validates :title, presence: true 

  scope :recently_updated, -> { order(updated_at: :desc) }

  def tag_list
    tags.pluck(:name).join(',')
  end

  def tag_list=(tag_str)
    self.tags = tag_str.split(',').map do |n|
      Tag.find_or_create_by! name: n
    end
  end
end
