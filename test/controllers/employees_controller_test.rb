require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "index" do
    get employees_path
    assert_response :success
  end

  test "create" do
    assert_difference -> { Employee.count }, 1 do
      post employees_path(employee: create_params, format: :js)
    end
    emp = Employee.order(:created_at).last
    assert_equal emp.first_name, "Tony"
    assert_equal emp.last_name, "Stark"
    assert_equal emp.salary, 80000
    assert_equal emp.email_address, "tonystark@gmail.com"
    assert_equal emp.phone, "9999999999"
    assert_equal emp.department_id, departments(:one).id
  end

  test "update" do
    patch employee_path(employees(:one), employee: {department_id: departments(:one).id}, format: :js)
    emp = Employee.order(:updated_at).last
    assert_equal emp.department_id, departments(:one).id
  end

  test "destroy" do
    assert_difference -> { Employee.count }, -1 do
      delete employee_path(employees(:one), format: :js)
    end
  end


  def create_params
    {
        first_name:    "Tony",
        last_name:     "Stark",
        salary:        "80000",
        email_address: "tonystark@gmail.com",
        phone:         "9999999999",
        department_id: departments(:one).id
    }
  end


end
