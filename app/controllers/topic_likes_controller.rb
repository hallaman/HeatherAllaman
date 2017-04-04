class TopicLikesController < ApplicationController
  before_action :set_topic_like, only: [:show, :edit, :update, :destroy]

  def upvote 
    @topic_like = TopicLike.find_or_create_by(hash_id: params[:topic_like_id])
    @topic_like.count = @topic_like.count.present? ? @topic_like.count + 1 : 1
    @topic_like.save
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { count: @topic_like.count, id: @topic_like.hash_id } }
    end
  end  

  # GET /topic_likes
  # GET /topic_likes.json
  def index
    @topic_likes = TopicLike.all
  end

  # GET /topic_likes/1
  # GET /topic_likes/1.json
  def show
  end

  # GET /topic_likes/new
  def new
    @topic_like = TopicLike.new
  end

  # GET /topic_likes/1/edit
  def edit
  end

  # POST /topic_likes
  # POST /topic_likes.json
  def create
    @topic_like = TopicLike.new(topic_like_params)

    respond_to do |format|
      if @topic_like.save
        format.html { redirect_to @topic_like, notice: 'Topic like was successfully created.' }
        format.json { render :show, status: :created, location: @topic_like }
      else
        format.html { render :new }
        format.json { render json: @topic_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topic_likes/1
  # PATCH/PUT /topic_likes/1.json
  def update
    respond_to do |format|
      if @topic_like.update(topic_like_params)
        format.html { redirect_to @topic_like, notice: 'Topic like was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic_like }
      else
        format.html { render :edit }
        format.json { render json: @topic_like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topic_likes/1
  # DELETE /topic_likes/1.json
  def destroy
    @topic_like.destroy
    respond_to do |format|
      format.html { redirect_to topic_likes_url, notice: 'Topic like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic_like
      @topic_like = TopicLike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_like_params
      params.require(:topic_like).permit(:hash_id, :count)
    end
end
