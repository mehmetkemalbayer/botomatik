class QuickReply
    include Mongoid::Document
    field :content_type, type: String
    field :title, type: String
    field :payload, type: String
    embedded_in :block
end