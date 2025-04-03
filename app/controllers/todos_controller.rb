class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  def index
    @todos = Todo.all
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    puts todo_params
    if @todo.update(todo_params)
      redirect_to todos_path 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private
    def todo_params
      params.expect(todo: [:title, :label, :priority, :due_date, :completed])
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
end
