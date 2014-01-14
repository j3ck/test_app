class CommentsController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_filter :authenticate_user!, :except => [:new, :create]
  before_action :set_comment, only: [:destroy, :moderated]

  def moderated
    @comment.update(premoderation: true)
    redirect_to @comment.book
  end

  def index
    @comments = Comment.order("premoderation ASC")
  end

  def new
    @comment = Comment.new(:parent_id => params[:parent_id], :book_id => params[:book_id])
    form_html = render_to_string( :partial => 'comments/add_comment', :formats => [:html], :locals => { :comment => @comment } )
    render :json => { :form_html => form_html }
  end

  def create
    @comment = Comment.new(comment_params)
    is_create = @comment.save
      if is_create
        comment_html = render_to_string( :partial => 'comments/comment', :formats => [:html], :locals => { :comment => @comment } )
        form_html = render_to_string( :partial => 'comments/add_comment',
                                      :formats => [:html],
                                      :locals => { :comment => @comment.book.comments.build } )
      else
        form_html = render_to_string( :partial => 'comments/add_comment', :formats => [:html], :locals => { :comment => @comment } )
      end
    render :json => { :create_status => is_create, :form_html => form_html,
                      :comment_html => comment_html }
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def comment_params
      params.require(:comment).permit(:email, :name, :content, :premoderation, :book_id, :parent_id)
    end
end
