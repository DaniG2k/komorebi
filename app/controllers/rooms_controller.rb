class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index
  before_action :authorize, only: [:edit, :destroy]
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  def my_rooms
    @rooms = Room.where(user_id: current_user.id)
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)
    @room.user = current_user

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'The room you were looking for could not be found.'
      redirect_to rooms_path
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(
        :price, :deposit, :internet, :furnished, :couples_ok,
        :smoking, :gender, :closest_station, :zone,
        :description, {room_images: []}, :remove_room_images)
    end

    def authorize
      unless Room.administrators.include?(current_user.id) || current_user == @room.user
        redirect_to(root_path, notice: t(:cannot_modify, scope: :rooms))
      end
    end
end
