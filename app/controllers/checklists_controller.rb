# frozen_string_literal: true

class ChecklistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @forms = Form.all
    @checklists = Checklist.all
    @checklist = Checklist.new
  end

  def new
    @form = Form.find(params[:checklist][:form_id])
    @checklist = Checklist.new
    questions = @form.questions
    questions.each do |question|
      @checklist.answers.build(question: question)
    end
  end

  def edit
    @checklist = Checklist.find(params[:id])
  end

  def create
    @checklist = Checklist.new(checklist_params)
    @checklist.user = current_user
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
