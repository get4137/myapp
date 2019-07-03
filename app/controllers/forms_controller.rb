# frozen_string_literal: true

class FormsController < ApplicationController
  load_and_authorize_resource
  def index
    @forms = Form.all
    @checklists = Checklist.all
    @checklist = Checklist.new
    # binding.pry
  end

  def new
    @form = Form.new
    @form.questions.build
  end

  def edit
    @form = Form.find(params[:id])
  end

  def publish
    @form = Form.find(params[:id])
    @form.status = 'Published'
    @form.save
  end

  def create
    @form = Form.new(form_params)
    if @form.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @form = Form.find(params[:id])
    if @form.update(form_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    redirect_to root_path
  end

  private

  def form_params
    params.require(:form).permit(:title, :body, :status, :published_at, questions_attributes: [:id, :title, :body, :_destroy])
  end
end