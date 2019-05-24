class EmpleadosController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_employee
    @employee = User.find(params[:id])
  end

  def employee_params
    params.require(:user).permit(:name, :last_name, :identification, :role, :email)
  end
end
