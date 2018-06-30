class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy, :crop]

  def index
    @employees = Employee.all.order(created_at: :desc)

  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit

  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save 
         
          format.html { render :show, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }

      else
        format.html { redirect_to @employee }
        # format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        if @employee.update_attributes(employee_params)
          format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
          format.json { render :show, status: :ok, location: @employee }
        else
          format.html { render :crop, notice: 'Employee was successfully updated.' }
          format.json { render :show, status: :ok, location: @employee }
        end
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :desc, :spec, :prof, :avatar, :avatar_cache, :remove_avatar, :crop_x, :crop_y, :crop_w, :crop_h
 )
  end
end
