class Destination < ApplicationRecord
    has_many :posts 
    has_many :bloggers, through: :posts 

    def five_most_recent_posts 
        self.posts.reverse.slice(0,5)
    end 

    def featured_post
        self.posts.max_by {|post| post.likes}
    end 

    def average_age_of_bloggers
        ages = self.bloggers.uniq.map {|blogger| blogger.age }
        if ages.length > 0 
        ages.sum / ages.length 
        end 
    end 

end
