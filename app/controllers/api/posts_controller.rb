module Api
  class PostsController < ApiController
    before_action :ensure_logged_in, except: [:index, :search]

    def create
      @post = current_user.posts.new(post_params)
      if current_user.is_member?(@post.blog)
        if @post.save
          @post.assign_tags(params[:tags])
          render partial: 'post', locals: {post: @post}
        else
          render json: @post.errors.full_messages, status: :unprocessable_entity
        end
      else
        redirect_to blog_url(@post.blog)
      end
    end

    def destroy
      @post = Post.find(params[:id])
      if current_user.authored?(@post) || current_user.owns?(@post.blog)
        @post.destroy!
        render json: {}
      else
        redirect_to blog_url(@post.blog)
      end
    end

    def index
      if params[:blog_id]
        @posts = Blog.find(params[:blog_id])
          .posts
          .includes(:users_liked_by)
      elsif params[:query]
        query = "%#{params[:query]}%"
        where_sql = <<-SQL
          tags.label LIKE :query
            OR posts.title LIKE :query
            OR posts.body LIKE :query
        SQL

        @posts = Post
          .includes(:tags)
          .includes(:author)
          .where(where_sql, query: query)
          .references(:tags)
      else
        @posts = current_user.feed_posts
          .includes(:author, :blog, :tags, :users_liked_by)
      end

      @posts = @posts.page(params[:page])
      render :index
    end

    def show
      @post = Post.find(params[:id])
      render partial: 'post', locals: {post: @post}
    end

    def update
      @post = Post.find(params[:id])
      if current_user.owns?(@post.blog) || current_user.authored?(@post)
        if @post.update_attributes(post_params)
          @post.assign_tags(params[:tags])
          render partial: 'post', locals: {post: @post}
        else
          render json: @post.errors.full_messages, status: :unprocessable_entity
        end
      end
    end

    private

    def ensure_blog_member(blog)
      unless current_user.is_member?(blog)
        flash[:errors] = ["You must be a member of the blog to perform that action!"]
        redirect_to blog_url(blog)
      end
    end

    def ensure_blog_owner(blog)
      if blog.owner != current_user
        flash[:errors] = ["You must be the blog's owner to perform that action!"]
        redirect_to blog_url(blog)
      end
    end

    def ensure_post_authorization(post)
      unless current_user.authored?(post) || current_user.owns?(post.blog)
        flash[:errors] = ["You are not authorized to perform that action."]
        redirect_to blog_url(post.blog)
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :blog_id)
    end
  end
end
