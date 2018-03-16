class MatchesController < ApplicationController
  def index
    @division = Division.find(params[:id])
    @matches = @division.find_matches
  end
end
