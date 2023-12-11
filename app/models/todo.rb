class Todo < ApplicationRecord
    # Changes the boolean to display a different message
    def get_item_status
        if(self.purchased)
            return "Purchased"
        else 
            return "Yet to buy"
        end
    end

    # has_one_attached allows images to be shown in 'show.html.erb' by setting up a map betwen an items record and a file
    has_one_attached :image
end