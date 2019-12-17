class PostController < ApplicationController
    before_action :authorized

    def create
        # FEELING COLUMN WILL NOT BE USED. DOESNT SEEM USEFUL
        newPost = Post.create(mainuser_id: @user.id, content: params[:content])
        render json: newPost
    end


end