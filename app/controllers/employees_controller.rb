class EmployeesController < ApplicationController
  before_action :employee, only: [:update, :edit, :destroy]

  def index
    @employees = Employee.all.includes(:department)
  end

  def new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save
  end

  def edit
  end

  def update
    @employee.update(employee_params)
  end

  def destroy
    @employee.destroy
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email_address, :phone, :salary, :department_id)
  end

  def employee
    @employee = Employee.find_by id: params[:id]
  end
end
