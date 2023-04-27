class BitesController < ApplicationController
  before_action :set_bite, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /bites or /bites.json
  def index
    @bites = Bite.all
  end

  # GET /bites/1 or /bites/1.json
  def show
  end

  # GET /bites/new
  def new
    # @bite = Bite.new
    @bite = current_user.bites.build
  end

  # GET /bites/1/edit
  def edit
  end

  # POST /bites or /bites.json
  def create
    # @bite = Bite.new(bite_params)
    @bite = current_user.bites.build(bite_params)

    respond_to do |format|
      if @bite.save
        format.html { redirect_to bite_url(@bite), notice: "Bite was successfully created." }
        format.json { render :show, status: :created, location: @bite }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bites/1 or /bites/1.json
  def update
    respond_to do |format|
      if @bite.update(bite_params)
        format.html { redirect_to bite_url(@bite), notice: "Bite was successfully updated." }
        format.json { render :show, status: :ok, location: @bite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bites/1 or /bites/1.json
  def destroy
    @bite.destroy

    respond_to do |format|
      format.html { redirect_to bites_url, notice: "Bite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

def correct_user
  @bite = current_user.bites.find_by(id: params[:id])
  redirect_to bites_path, notice: "Not Authorized to edit this Bite" if @bite.nil?

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bite
      @bite = Bite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bite_params
      params.require(:bite).permit(:image, :name, :description, :price, :user_id)
    end
end
