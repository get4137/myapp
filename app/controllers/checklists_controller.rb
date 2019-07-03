# frozen_string_literal: true

class ChecklistsController < ApplicationController
  before_action :authenticate_user!
  def new
    # binding.pry
    @form = Form.find(params[:checklist][:form_id])
    @checklist = Checklist.new

    questions = @form.questions
    questions.each do |question|
      @checklist.answers.build(question: question)
    end
    # binding.pry
  end

  def edit
    @checklist = Checklist.find(params[:id])
    # binding.pry
  end

  def create
    # binding.pry
    @checklist = Checklist.new(checklist_params)
    @checklist.user = current_user
    # binding.pry
    if @checklist.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @checklist = Checklist.find(params[:id])
    if @checklist.update(checklist_params)
      # binding.pry
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @checklist = Checklist.find(params[:id])
    @checklist.destroy
    redirect_to root_path
  end

  private

  def checklist_params
    params.require(:checklist).permit(:project_uid, :form_id, answers_attributes: %i[id question_id value comment _destroy])
  end

end
