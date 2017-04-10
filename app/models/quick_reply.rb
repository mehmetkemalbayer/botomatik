class QuickReply
    include Mongoid::Document
    field :content_type, type: string
    field :title, type: string
    field :payload, type: string
    embedded_in :block
end