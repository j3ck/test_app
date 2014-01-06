class CommentsController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_filter :authenticate_user!, :except => [:show, :new, :create]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.order("premoderation ASC")
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new(:parent_id => params[:parent_id], :book_id => params[:book_id])
    form_html = render_to_string( :partial => 'comments/add_comment', :formats => [:html], :locals => { :comment => @comment } )
    render :json => { :form_html => form_html }
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    #respond_to do |format|
      if @comment.save
        comment_html = render_to_string( :partial => 'comments/comment', :formats => [:html], :locals => { :comment => @comment } )
        form_html = render_to_string( :partial => 'comments/add_comment',
                                      :formats => [:html],
                                      :locals => { :comment => @comment } )
      #  format.html { redirect_to @comment.book, notice: 'Comment was successfully created.' }
      #  format.json { render action: 'show', status: :created, location: @comment }
      #else
      #  format.html { redirect_to @comment.book }
      #  format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    #end
    render :json => { :create_status => @comment, :form_html => form_html,
                      :comment_html => comment_html, :book_id => @comment.book_id }
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:email, :name, :content, :premoderation, :book_id, :parent_id)
    end
end
