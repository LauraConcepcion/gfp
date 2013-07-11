class ScoresController < InheritedResources::Base
  respond_to :html, :json, :js

  # def update
  #   @score = Score.find params[:id]

  #   respond_to do |format|
  #     if @score.update_attributes(params[:score])
  #       format.html { redirect_to(@score, :notice => 'Score was successfully updated.') }
  #       format.json { respond_with_bip(@score) }
  #     else
  #       format.html { render :action => "edit" }
  #       format.json { respond_with_bip(@score) }
  #     end
  #   end
  # end
end
