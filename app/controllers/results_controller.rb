class ResultsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def get_all_results
		@results = Result.all.order(score: :desc)
	end

	def add_result
		parsed_body = get_parse_body
		@result = Result.create(
			score: parsed_score(parsed_body),
      nickname: parsed_nickname(parsed_body),
			date: Time.now)

		if @result.save
      respond_to do |format|
      	format.json {
    	  render json: {success: true}
      	}
      end
    else
      respond_to do |format|
      	format.json {
    	  render json: {success: false}
      	}
      end
    end
	end

  def get_parse_body
    request.body.rewind
    request_body = request.body.read
    if request_body.empty?
      request_body = '{}'
    end
    parsed_body = JSON.parse(request_body)
    parsed_body
  end

  def parsed_score parsed_body
    if parsed_body['score'].nil?
      return 0
    else
      return parsed_body['score']
    end
  end

  def parsed_nickname parsed_body
    if parsed_body['nickname'].nil?
      return "noname"
    else
      return parsed_body['nickname']
    end
  end

end
