class Recipe < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable

  scope :recent, -> { order('id DESC').limit(5) }
  scope :popular_tags, -> {tag_counts_on(:tags).limit(5).order('taggings_count DESC')}

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "blog/blog2.jpg"
  validates_attachment :image,
    :content_type => { :content_type => "image/jpg" ,:content_type => "image/jpeg", :content_type => "image/png" },
    :size => { :in => 0..10000.kilobytes }
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
  validates :title, :body, :status, presence: true

  def short_desc
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vulputate eros nec odio egestas in dictum nisi vehicula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse porttitor luctus imperdiet. <a href=\"#\">Praesent ultricies</a> enim ac ipsum aliquet pellentesque. Nullam justo nunc, dignissim at convallis posuere, sodales eu orci. Duis a risus sed dolor placerat semper quis in urna. Ut <strong>commodo ullamcorper risus nec</strong> viverra, dignissim eget est."
  end
end
