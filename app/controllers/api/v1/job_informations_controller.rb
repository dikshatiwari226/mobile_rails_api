class Api::V1::JobInformationsController < Api::V1::ApiController
  

  def search
    @job_informations = JobInformation.ransack(title_cont: params[:q]).result(distinct: true).limit(5)
  end

  # GET /job_informations
  # GET /job_informations.json
  def index
    @job_informations = JobInformation.all
    if @job_informations.present?
      return render json: {status: 200, data: {job_informations: @job_informations}, :message =>"Show all job informations"} 
    else
      return render json: {status: 401, data: {user: nil, errors: @job_informations.errors}, :message =>" Rollback all job informations"} 
    end 
  end

  # GET /job_informations/1
  # GET /job_informations/1.json
  def show
  end

  # GET /job_informations/new
  def new
    @job_information = JobInformation.new
  end

  # GET /job_informations/1/edit
  def edit
  end

  # POST /jobjob?q=_informations
  # POST /job_informations.json
  def create
    @job_information = JobInformation.new(job_information_params)

    respond_to do |format|
      if @job_information.save
        format.html { redirect_to @job_information, notice: 'Job information was successfully created.' }
        format.json { render :show, status: :created, location: @job_information }
      else
        format.html { render :new }
        format.json { render json: @job_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_informations/1
  # PATCH/PUT /job_informations/1.json
  def update
    respond_to do |format|
      if @job_information.update(job_information_params)
        format.html { redirect_to @job_information, notice: 'Job information was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_information }
      else
        format.html { render :edit }
        format.json { render json: @job_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_informations/1
  # DELETE /job_informations/1.json
  def destroy
    @job_information.destroy
    respond_to do |format|
      format.html { redirect_to job_informations_url, notice: 'Job information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_information
      @job_information = JobInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_information_params
      params.require(:job_information).permit(:job_title, :company_name, :job_description, :company_location, :post_date)
    end

    def force_json
      request.format = :json
    end
end
