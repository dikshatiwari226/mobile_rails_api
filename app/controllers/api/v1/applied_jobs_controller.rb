class Api::V1::AppliedJobsController < Api::V1::ApiController
  before_action :set_applied_job, only: [:show, :edit, :update, :destroy]

  # GET /applied_jobs
  # GET /applied_jobs.json
  def index
    @applied_jobs = AppliedJob.all
    if @applied_jobs.present?
      return render json: {status: 200, data: {applied_jobs: @applied_jobs}, :message =>"Show all applied_jobs"} 
    else
      return render json: {status: 401, data: {errors: @applied_jobs.errors}, :message =>" Rollback all applied_jobs"} 
    end  
  end

  # GET /applied_jobs/1
  # GET /applied_jobs/1.json
  def show
    @applied_jobs = AppliedJob.find(params[:id])
    render json: @applied_jobs
  end

  # GET /applied_jobs/new
  def new
    @applied_job = AppliedJob.new
  end

  # GET /applied_jobs/1/edit
  def edit
    render json: @applied_job
  end

  def update
    @applied_job = AppliedJob.find(params[:id])
    if @applied_job.update(position: params[:position], company: params[:company], application_no: params[:application_no], date_applied: params[:date_applied], application_status: params[:application_status],resume: params[:resume])
      return render json: {status: 200, data: {applied_job: @applied_job}, :message =>"Applied_job Successfully Updated"} 
    else
       return render json: { status: 401,  errors: applied_job.errors.full_messages }
    end
  end


  # POST /applied_jobs
  # POST /applied_jobs.json
  def create
    @applied_job = AppliedJob.new(position: params[:position], company: params[:company], application_no: params[:application_no], date_applied: params[:date_applied], application_status: params[:application_status],resume: params[:resume])
    if @applied_job.save
     return render json: { status: 200, data: {applied_job: @applied_job} , message: "Applied job was successfully created." }
    else
     return render json: { status: 401,  errors: @applied_job.errors.full_messages }
    end
  end


  # DELETE /applied_jobs/1
  # DELETE /applied_jobs/1.json
  def destroy
    @applied_job = AppliedJob.find(params[:id])
    if @applied_job.destroy
      return render json: {status: 200, data: {applied_job: @applied_job}, :message =>"Applied job was successfully destroyed."}
    else
      return render json: { status: 401,  errors: @applied_job.errors.full_messages }
    end
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applied_job
      @applied_job = AppliedJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applied_job_params
      params.require(:applied_job).permit(:position, :company, :application_no, :date_applied, :application_status, :resume)
    end
end
