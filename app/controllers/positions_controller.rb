class PositionsController < ApplicationController
  # PUT /positions/1.json
  def update
    @position = Position.find(params[:id])
    Rails.logger.info @position.inspect
    Rails.logger.info params[:position].inspect
    respond_to do |format|
      if @position.update_attributes(params[:position])
        format.html { redirect_to @position, notice: 'Position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end
end
