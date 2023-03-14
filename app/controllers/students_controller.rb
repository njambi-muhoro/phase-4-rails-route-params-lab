class StudentsController < ApplicationController

  def index
    if params[:name].present?
      students = Student.where('first_name LIKE ? OR last_name LIKE ?', "%#{params[:name]}%", "%#{params[:name]}%")
    else
      students = Student.all
    end
    render json: students
  end
  # This code defines an index method in the StudentsController 
  # class that responds to a GET request on the '/students' route.
  #    It checks if there is a name parameter present in the request 
  #    query params using params[:name].present?. If the name parameter is present,
  #     it searches for students whose first or last name matches the query using the 
  #     where method on the Student model. The query looks for students whose first name
  #      or last name contains the value of the name parameter using the LIKE operator and 
  #      wildcard % to match partial strings. If the name parameter is not present, it returns
  #       all students using the all method on the Student model. Finally, it renders the result
  #        as JSON using the render json: method.

  def show
    student = Student.find_by(id: params[:id])
    render json: student
  end
end
