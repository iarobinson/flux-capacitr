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
        @posts = Blog.find(params[:blog_id]).posts
                      .includes(:users_liked_by)
                      .page(params[:page])
      else
        @posts = current_user
                 .feed_posts
                 .includes(:author, :blog, :tags, :users_liked_by)
                 .page(params[:page])
      end
      render :index
    end

    def new
      @post = current_user.posts.new
      @post.blog_id = params[:blog_id]
      render partial: 'post', locals: {post: @post}
    end

    def search
      query = "%#{params[:query]}%"
      @posts = Post
        .includes(:tags)
        .includes(:author)
        .where(<<-SQL, query, query, query).references(:tags).page(params[:page])
          tags.label LIKE ? OR posts.title LIKE ? OR posts.body LIKE ?
        SQL
      render 'index.json.jbuilder'
    end

    def show
      @post = Post.find(params[:id])
      render partial: 'post', locals: {post: @post}
    end

    def toggle_like
      @post = Post.find(params[:id])
      if current_user.can_like?(@post)
        if @post.is_liked_by?(current_user)
          current_user.liked_posts.delete(@post)
        else
          current_user.liked_posts << @post
        end
      end
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
