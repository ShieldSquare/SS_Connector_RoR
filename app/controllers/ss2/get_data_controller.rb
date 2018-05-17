module Ss2
	class GetDataController < ApplicationController
		skip_before_action :authenticate_user!, raise: false

		def create
			if params['jsonString'] != ""
				error_code = Ss2.send_js_request request, params
			end
	    respond_to do |format|
	      format.json {
	        render :json => { error_code: error_code}
	      }
	    end
		end
	end
end
