class LargestRangesController < ApplicationController
  before_action :set_largest_range, only: [ :update, :destroy]

  # GET /largest_ranges
  def index
    @largest_ranges = LargestRange.all

    render json: @largest_ranges
  end

  # GET /largest_ranges/1
  def show
    team = Team.find(params[:id])
    out_array = team.members.sort
    ranges = []
    @array_temp = []
    out_array.each_with_index do |e, index| # e es elemento, i es la posición 
      if index == 0
        @array_temp.push(e)
      elsif @array_temp.last.to_i + 1 == e.to_i
        @array_temp.push(e)
        ranges.push(@array_temp) if e == out_array.last.to_i
      else
        ranges.push(@array_temp)
        @array_temp = [e]
      end
    end
    array_length = ranges.max { |a, b| a.length <=> b.length }
    render json: [array_length.first, array_length.last]
  end

  # POST /largest_ranges
  def create
    @largest_range = LargestRange.new(largest_range_params)

    if @largest_range.save
      render json: @largest_range, status: :created, location: @largest_range
    else
      render json: @largest_range.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /largest_ranges/1
  def update
    if @largest_range.update(largest_range_params)
      render json: @largest_range
    else
      render json: @largest_range.errors, status: :unprocessable_entity
    end
  end

  # DELETE /largest_ranges/1
  def destroy
    @largest_range.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_largest_range
      @largest_range = LargestRange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def largest_range_params
      params.require(:largest_range).permit(:end_array)
    end
end
