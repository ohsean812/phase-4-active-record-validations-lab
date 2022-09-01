class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    # validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait_phrase

    def clickbait_phrase
        phrase = [/Won't Believe/i, /Secret/i, /Top [number]/i, /Guess/i]
        if phrase.none? { |start| start.match title }
        errors.add(:title, "Must enter a catch phrase")        
        end
    end

end
