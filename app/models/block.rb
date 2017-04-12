class Block 
    include Mongoid::Document    
    field :name, type: String
    field :text, type: String
    field :type, type: String
    field :action, type: String
    embeds_many :quick_replies             
end
