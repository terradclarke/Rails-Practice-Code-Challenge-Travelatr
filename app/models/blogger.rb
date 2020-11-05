class Blogger < ApplicationRecord
    has_many :posts 
    has_many :destinations, through: :posts 

    validates :name, uniqueness: true 
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def total_likes 
        total = 0 
        self.posts.each do |post| 
            total += post.likes 
        end 
        total 
    end 

    def featured_post 
        self.posts.max_by {|post| post.likes}
    end 

    def self.most_written_about_destinations
    end 

end
