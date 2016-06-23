class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toogle_status_task]
  before_action :authenticate_user! 
  before_action :correct_user, only: [:edit, :update, :destroy, :destroy_task]  
  skip_before_action :verify_authenticity_token, only: [:toogle_status_task]
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
      @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      unless (request.referrer.include? "/tasks")
        format.html { redirect_to root_url, notice: 'Task was successfully destroyed.' }
      else
         format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end

  def task_create
    @task = current_user.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to root_url, notice: 'Task was successfully created.' }
        format.json { render root_url, status: :created, location: @task }
      else
        format.html { redirect_to root_url}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
    
  end
  
  def toogle_status_task
    @task.update(task_params)
    respond_to do |format|
      if @task.update(task_params)
        format.js {}
        format.json { render json: @task, status: :ok, location: @task }
      else
        format.js {}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :priority, :status, :board_id,:name)
    end
    
    # Vefify correct user  
    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to tasks_path, notice: "Not authorized to edit this task" if @task.nil?
    end
    
end
