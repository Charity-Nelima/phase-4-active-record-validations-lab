class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait_y?

    CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]
    def clickbait_y?
        if CLICKBAIT.none? { |word| word.match title }
            errors.add(:title, "must contain words below - Won't Believe, Secret, Top [number], Guess")
        unless ((/Won't Believe/i.match title) || (/Secret/i.match title) || (/Top \d/i.match title) || (/Guess/i.match title)) 
            errors.add(:title, "must be clickbait_y")
        end
    
    end
end
end
