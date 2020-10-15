class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def update
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      redirect_to edit_student_path(@student)
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  def create
    @student = Student.create(student_params)
    # redirect_to student_path(@student)
    if @student.valid?
      flash[:success] = "WELCOME TO THE MENU!!"
      redirect_to student_path(@student)
    else 
      flash[:my_errors] = @student.errors.full_messages
      
      redirect_to new_student_path
    end 
  end

  def show
    
  end


  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :mod)
  end


end
