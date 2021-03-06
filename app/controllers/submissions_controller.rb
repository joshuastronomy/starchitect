class SubmissionsController < ApplicationController
  # before_action :require_login
  before_action :set_submission, only: %i[show update destroy]

  # GET /submissions
  def index
    @submissions = Submission.order('created_at DESC')

    render json: @submissions
  end

  # GET /submissions/1
  def show
    render json: @submission
  end

  # POST /submissions
  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      track_activity @submission

      render json: @submission, status: :created
    else
      render json: { errors: @submission.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /submissions/1
  def update
    if @submission.update(submission_params)
      track_activity @submission

      render json: @submission
    else
      render json: { errors: @submission.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /submissions/1
  def destroy
    track_activity @submission

    @submission.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_submission
    @submission = Submission.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def submission_params
    params.permit(:submit_type, :submit_object, :title, :body, :user_id)
  end
end
