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
    
    def create
        @block = Block.new(block_params)

        if (@block.save)
            respond_to do |format|
                format.html {render :template => "block/text/edit"}
            end            
        end        
    end
    def block_params
    params.require(:block).permit(:name, :text, :quick_replies)
  end
end
