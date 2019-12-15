class ScoresController < ApplicationController
  def create
    @score = Score.new(score_params)
    if @score.save
      redirect_to test_path(@score.test.id)
    else
      redirect_to test_path(@score.test.id)
    end
  end

  def destroy
    @score = Score.find(params[:id])
    test_id = @score.test_id
    @score.destroy
    redirect_to test_path(test_id)
  end
  
  private
  def score_params
    params.require(:score).permit(:score, :student_id, :test_id)
  end
end
