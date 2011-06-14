class ConversationsController < ApplicationController

  before_filter :load_board
  
  # GET /conversations
  # GET /conversations.xml
  def index
    @conversations = Conversation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @conversations }
    end
  end

  # GET /conversations/1
  # GET /conversations/1.xml
  def show
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @conversation }
    end
  end

  # GET /conversations/new
  # GET /conversations/new.xml
  def new
    @conversation = Conversation.new
    @comment = @conversation.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @conversation }
    end
  end

  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
  end

 # POST /conversations
def create
  @conversation = Conversation.new(params[:conversation])
  @comment = @conversation.comments.build(params[:comment])
  @conversation.user_id  = @comment.user_id = current_user.id
  @conversation.board = @board
  
  respond_to do |format|
    if current_user && @conversation.save
      format.html { redirect_to(board_path(@board), :notice => 'Your Post was created') }
    else
      format.html { render :action => "new" }
    end
  end
end

  # PUT /conversations/1
  # PUT /conversations/1.xml
  def update
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      if @conversation.update_attributes(params[:conversation])
        format.html { redirect_to(@conversation, :notice => 'Conversation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @conversation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.xml
  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to(conversations_url) }
      format.xml  { head :ok }
    end
  end

  private
  
  def load_board
    if Board.exists?(params[:board_id])
      @board = Board.find(params[:board_id]);
    end
              
    unless @board
      redirect_to(boards_path, :notice =>"Please specify a valid board")
    end
  end

  # GET /conversations/reply
  def reply
    @conversation = Conversation.find(params[:id])
    @comment = @conversation.comments.build
    
    respond_to do |format|
      format.html #reply.html.erb
    end
  end
  
  # POST /conversations/reply
  def save_reply
    if !current_user
      redirect_to(:signin, :notice =>"Please login before posting")
      return 1
    end
    
    if Conversation.exists?(params[:id])
      @conversation = Conversation.find(params[:id])
      @comment = @conversation.comments.build(params[:comment])
      @comment.user_id = current_user.id
    else
      redirect_to(boards_path, :notice =>"Please specify a valid board")
    end
        
    respond_to do |format|
      if current_user && @comment.save
        format.html { redirect_to(board_path(@board), :notice => 'Your reply was posted') }
      else
        format.html { render :action => "new" }
      end
    end
  end

end
