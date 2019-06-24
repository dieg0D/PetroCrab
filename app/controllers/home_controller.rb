class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  include HomeHelper

  def index

  end

  def record

  end

  def create 
    # require "http"
    # require "json"
    
    # response = Unirest.post "https://petadata-simple-audio-and-sound-converter-v1.p.rapidapi.com/Convert",
    # headers:{
    # "X-RapidAPI-Host" => "petadata-simple-audio-and-sound-converter-v1.p.rapidapi.com",
    # "X-RapidAPI-Key" => "06d1dff59amshb36070fbedd9923p15b1fejsn45d275e5aace"
    # },
    # parameters:{
    #   "file" => File.new(params[:file].path),
    #   "targetFormat" => "WAV"
    # }
  
    # p response.body
  


    # response = HTTP.headers('X-RapidAPI-Host': 'petadata-simple-audio-and-sound-converter-v1.p.rapidapi.com','X-RapidAPI-Key': '06d1dff59amshb36070fbedd9923p15b1fejsn45d275e5aace').post("https://petadata-simple-audio-and-sound-converter-v1.p.rapidapi.com/Convert", json:
    #       {
    #         file: File.new(params[:file].path),
    #         targetFormat: "WAV"
    #       }
    #   )
    @response = df_call(params[:file].path)
    @r = JSON.parse(@response)
    @json = {params[:file].original_filename => {@r["intent"]["displayName"] => @r['parameters'].reject{|key, value| value.empty?}}}
    respond_to do |format|
      format.js
    end
  end

end
