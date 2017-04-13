class BlocksController < ApplicationController
    def new_galery
        @block = Block.new
        respond_to do |format|
            format.html { render :template => "block/galery/new" }
        end        
    end
    def new_text
        @block = Block.new
        respond_to do |format|
            format.html { render :template => "block/text/new" }
        end        
    end
    def edit_text        
        @block = Block.where(:name => params[:id].upcase).first
        respond_to do |format|
            format.html { render :template => "block/text/edit" }
        end    
        
    end 
    def destroy_quick_reply
        @block = Block.find(params[:id])
        if(@block.quick_replies.find(params[:quick_reply_id]).destroy)
            redirect_to edit_text_block_path(@block.name)
        end
        
    end
    def destroy
        if(Block.find(params[:id]).destroy)
            redirect_to root_path
        end
        
    end
    
    def edit
        @block = Block.where(:name => block_params[:name]).first
    end
    def update
        @block = Block.where(:name => block_params[:name]).first 
        @quick_reply = QuickReply.new(title: params[:block][:quick_replies][:title], payload: params[:block][:quick_replies][:payload] )
        unless @block.quick_replies.where(title: params[:block][:quick_replies][:title], payload: params[:block][:quick_replies][:payload])
            @block.quick_replies.push(@quick_reply)          
        end
        @block.name = params[:block][:name].upcase
        @block.text = params[:block][:text]
        if (@block.save)
            redirect_to root           
        end    
    end    
    def create
        @block = Block.where(:name => block_params[:name]).first
        unless (@block) 
            @block = Block.new(block_params)
        end
                
        @quick_reply = QuickReply.new(title: params[:block][:quick_replies][:title], payload: params[:block][:quick_replies][:payload] )
        @block.quick_replies.push(@quick_reply)          
        @block.name = params[:block][:name]
        @block.text = params[:block][:text]      
        if (@block.save)
            respond_to do |format|
                format.html {render :template => "block/text/edit/"}
            end            
        end        
    end
    def block_params
        params.require(:block).permit(:name, :text, quick_replies_attributes: [:title, :payload] )
    end
end
