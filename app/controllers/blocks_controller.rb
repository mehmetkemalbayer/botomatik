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
    end
    
end
