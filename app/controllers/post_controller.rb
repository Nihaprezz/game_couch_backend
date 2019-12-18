class PostController < ApplicationController
    before_action :authorized

    def create
        # FEELING COLUMN WILL NOT BE USED. DOESNT SEEM USEFUL
        user = User.find(@user.id)
        newPost = Post.create(mainuser_id: user.id, content: params[:content])
             
        render json: {
            post_id: newPost.id,
            post_content: newPost.content,
            post_created: newPost.created_at,
            post_user: newPost.mainuser.username,
            post_user_image: newPost.mainuser.avatar,
            post_user_id: newPost.mainuser.id
        }
    end

    def all 
        user = User.find(@user.id)
        relatedPosts = [] ## <--- will contain usersPosts and friends posts

        friendsPosts = []
        friends = user.friends
        friends.each do | friend |
            if friend.posts.length !=  0 
                friend.posts.each do | post |
                    friendsPosts << {post_id: post.id,
                    post_content: post.content,
                    post_created: post.created_at, 
                    post_user: post.mainuser.username, 
                    post_user_image: post.mainuser.avatar,
                    post_user_id: post.mainuser.id}
                end
            end
        end

        myPosts = []
        user.posts.each do | post |
            myPosts << {
                post_id: post.id,
                post_content: post.content,
                post_created: post.created_at,
                post_user: post.mainuser.username,
                post_user_image: post.mainuser.avatar,
                post_user_id: post.mainuser.id
            }
        end


        render json: {usersPosts: myPosts, usersFriendsPosts: friendsPosts}
    end


    
end