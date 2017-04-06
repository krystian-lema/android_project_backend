class ResultsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def get_all_results
		@results = Result.all.order(score: :desc)
	end

	def add_result
		parsed_body = get_parse_body
		@result = Result.create(
			score: parsed_body['score'],
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

end
