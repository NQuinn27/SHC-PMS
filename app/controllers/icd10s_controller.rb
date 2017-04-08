class Icd10sController < ApplicationController
  before_action :set_icd10, only: [:show, :edit, :update, :destroy]

  # GET /icd10s
  # GET /icd10s.json
  def index
    @icd10s = Icd10.all.paginate(:page => params[:page], :per_page => 30)
  end



  # GET /icd10s/1
  # GET /icd10s/1.json
  def show
  end

  # GET /icd10s/new
  def new
    @icd10 = Icd10.new
  end

  # GET /icd10s/1/edit
  def edit
  end

  # POST /icd10s
  # POST /icd10s.json
  def create
    @icd10 = Icd10.new(icd10_params)

    respond_to do |format|
      if @icd10.save
        format.html { redirect_to @icd10, notice: 'Icd10 was successfully created.' }
        format.json { render :show, status: :created, location: @icd10 }
      else
        format.html { render :new }
        format.json { render json: @icd10.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icd10s/1
  # PATCH/PUT /icd10s/1.json
  def update
    respond_to do |format|
      if @icd10.update(icd10_params)
        format.html { redirect_to @icd10, notice: 'Icd10 was successfully updated.' }
        format.json { render :show, status: :ok, location: @icd10 }
      else
        format.html { render :edit }
        format.json { render json: @icd10.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icd10s/1
  # DELETE /icd10s/1.json
  def destroy
    @icd10.destroy
    respond_to do |format|
      format.html { redirect_to icd10s_url, notice: 'Icd10 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icd10
      @icd10 = Icd10.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def icd10_params
      params.fetch(:icd10, {})
    end
end
