class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

def clickbait
    if !self.title.nil? && (!self.title.include?("Won't Believe" || "Secret" || "Top" || "Guess"))
        errors.add(:title, "must be clickbait-y")
    end
end
end
