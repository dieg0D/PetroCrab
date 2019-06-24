class Api::V1::AudioController < ApiController

  def create
    respond_to do |format|
      format.json
    end
  end

end