module HomeHelper

  def df_call(audio)
    project_id = "green-webbing-230900"
    session_id = "gero"
    audio_file_path = audio
    language_code = "pt-BR"

    require "google/cloud/dialogflow"

    session_client = Google::Cloud::Dialogflow::Sessions.new
    session = session_client.class.session_path project_id, session_id
    puts "Session path: #{session}"

    begin
      audio_file = File.open audio_file_path, "rb"
      input_audio = audio_file.read
    ensure
      audio_file.close
    end

    audio_config = {
      audio_encoding:    :AUDIO_ENCODING_LINEAR_16,
      language_code:     language_code
    }

    query_input = { audio_config: audio_config }

    response = session_client.detect_intent session, query_input, input_audio: input_audio
    #puts response
     query_result = response.query_result

    return query_result.to_json
  end
end
