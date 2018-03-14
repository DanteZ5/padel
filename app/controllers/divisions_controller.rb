class DivisionsController < ApplicationController

  def index
    @divisions = Division.all
  end

  def create
    if Division.count == 0
      name = "Division 1"
    else
      last_name = Division.last.name
      splitted_name = last_name.split(' ')
      i = splitted_name[1].to_i
      name = "Division #{i+1}"
    end
    Division.create(name: name)
    redirect_to divisions_path
  end

  def destroy
    Division.last.destroy
    redirect_to divisions_path
  end
end
