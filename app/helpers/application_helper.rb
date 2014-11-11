module ApplicationHelper
  
  def title(title = nil)
    puts "TITLE METHOD: #{title}"
    if title.present?
      content_for :title, title
    else
      content_for?(:title) ? content_for(:title) : ENV['default_title']
    end
  end
  
  def meta_keywords(tags = nil)
    puts "META KEYWORDS METHOD: #{tags}"
    if tags.present?
      content_for :meta_keywords, tags
    else
      content_for?(:meta_keywords) ? content_for(:meta_keywords) : ENV['meta_keywords']
    end
  end

  def meta_description(desc = nil)
    puts "META DESCRIPTION METHOD: #{desc}"
    if desc.present?
      content_for :meta_description, desc
    else
      content_for?(:meta_description) ? content_for(:meta_description) : ENV['meta_description']
    end
  end
  
end