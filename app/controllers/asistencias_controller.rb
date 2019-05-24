class AsistenciasController < ApplicationController
  before_action :set_user
  before_action :set_asistencia, only: [:show, :edit, :update, :destroy]

  # GET /asistencias
  # GET /asistencias.json
  def index
    @asistencias = Asistencia.where(user_id: @user.id)
    best_employee = Asistencia.get_best_employee
    worst_employee = Asistencia.get_worst_employee

    if (!best_employee.blank? && !worst_employee.blank?)
      @get_best_employee = User.get_user(best_employee.keys[0])
      @get_worst_employee = User.get_user(worst_employee.keys[0])
    else
      @get_best_employee = ''
      @get_worst_employee = ''
    end
  end

  # GET /asistencias/1
  # GET /asistencias/1.json
  def show
  end

  # GET /asistencias/new
  def new
    @asistencia = Asistencia.new
  end

  # GET /asistencias/1/edit
  def edit
  end

  # POST /asistencias
  # POST /asistencias.json
  def create
    @asistencia = Asistencia.new(asistencia_params)
    @asistencia.user_id = @user.id
    @asistencia.counter =  @asistencia.salida - @asistencia.entrada
    respond_to do |format|
      if @asistencia.save
        format.html { redirect_to empleado_asistencias_path(@user, @asistencia), notice: 'Asistencia was successfully created.' }
        format.json { render :show, status: :created, location: @asistencia }
      else
        format.html { render :new }
        format.json { render json: @asistencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asistencias/1
  # PATCH/PUT /asistencias/1.json
  def update
    respond_to do |format|
      oe
      @asistencia.counter =  @asistencia.salida - @asistencia.entrada
      if @asistencia.update(asistencia_params)
        format.html { redirect_to empleado_asistencias_path(@user, @asistencia), notice: 'Asistencia was successfully updated.' }
        format.json { render :show, status: :ok, location: @asistencia }
      else
        format.html { render :edit }
        format.json { render json: @asistencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asistencias/1
  # DELETE /asistencias/1.json
  def destroy
    @asistencia.destroy
    respond_to do |format|
      format.html { redirect_to empleado_asistencias_path(@user, @asistencia), notice: 'Asistencia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asistencia
      @asistencia = Asistencia.find(params[:id])
    end

    def set_user
      @user = User.find(params[:empleado_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def asistencia_params
      params.require(:asistencia).permit(:entrada, :salida, :user_id, :counter, :empleado_id)
    end
end
