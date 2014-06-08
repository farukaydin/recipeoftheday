class Recipe < ActiveRecord::Base
  belongs_to :user

  acts_as_taggable

  scope :recent, -> { order('id DESC').limit(4) }

  def short_desc
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vulputate eros nec odio egestas in dictum nisi vehicula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse porttitor luctus imperdiet. <a href=\"#\">Praesent ultricies</a> enim ac ipsum aliquet pellentesque. Nullam justo nunc, dignissim at convallis posuere, sodales eu orci. Duis a risus sed dolor placerat semper quis in urna. Ut <strong>commodo ullamcorper risus nec</strong> viverra, dignissim eget est."
  end

  def image
    "/assets/blog/blog2.jpg"
  end
end
