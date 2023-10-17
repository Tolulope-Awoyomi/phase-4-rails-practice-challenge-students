class StudentsController < ApplicationController

    def create
        student = Student.create(student_params)
        if student.valid?
            render json: student, status: :created
        else
            render json: { error: student.errors.full_messages }, status: unprocessable_entity
        end
    end

    def index 
        students = Student.all
        render json: students
    end

    def show
        student = Student.find_by(id: params[:id])
        if student
            render json: student, status: :ok
        else 
            render json: { error: "Cannot find student" }, status: :not_found
        end
    end

    def update
        student = Student.find_by(id: params[:id])
        if student
            if student.update(student_params)
                render json: student, status: :accepted
            else
                render json: { error: student.errors.full_messages }, status: :unprocessable_entity
            end
        else
            render json: { error: "Cannot find student" }, status: :not_found
        end
    end

    def destroy
        student = Student.find_by(id: params[:id])
        if student
            student.destroy
            head :no_content
        else 
            render json: {error: "Cannot find student"}, status: :not_found
        end
    end

    private

    def student_params
        params.permit(:name, :major, :age)
    end
end
