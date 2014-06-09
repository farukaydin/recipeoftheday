class Recipe < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable

  default_scope { where(status: 1) }
  scope :recent, -> { order('id DESC').limit(5) }
  scope :popular_tags, -> {tag_counts_on(:tags).limit(5).order('taggings_count DESC')}

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "blog/blog2.jpg"
  # validates_attachment :image,
    # :content_type => { :content_type => "image/jpg" ,:content_type => "image/jpeg", :content_type => "image/png" },
    # :size => { :in => 0..10000.kilobytes }
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  validates :title, :body, :status, presence: true

  def short_desc
    self.body[0..500]
  end
end
