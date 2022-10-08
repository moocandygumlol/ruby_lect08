class ScoresController < ApplicationController
  before_action :set_score, only: %i[ show edit update destroy ]
  $b = "0"
  $m = ""
  # GET /scores or /scores.json
  def index
    $b = "0"
    $m = ""
    @scores = Score.all
  end

  # GET /scores/1 or /scores/1.json
  def show
    @x = $b
    @y = $m
  end

  # GET /scores/new
  def new
    @score = Score.new
    if(params[:back] != "")
      $b = params[:back]
    end
    @x = $b
    $m = params[:stu_id]
    if($m == "")
      $m = params[:id]
    end
    @y = $m
    
  end

  # GET /scores/1/edit
  def edit
    if(params[:back] != "")  
      $b = params[:back]
    end
    if($m == "")
      if(params[:stu_id] == "")
        $m = params[:id]
      else
        $m = params[:stu_id]
      end
    end
    @x = $b
    @y = $m
  end

  # POST /scores or /scores.json
  def create
    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to score_url(@score), notice: "Score was successfully created." }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
    @x = $b
    @y = $m
  end

  # PATCH/PUT /scores/1 or /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to score_url(@score), notice: "Score was successfully updated." }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1 or /scores/1.json
  def destroy
    @score.destroy

    respond_to do |format|
      format.html { redirect_to scores_url, notice: "Score was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def score_params
      params.require(:score).permit(:subject, :point, :grade, :student_id)
    end
end
