class ApiV1::TestController < ApplicationController
    def index
        render :json => {
            message: "Success",
            version: "1.0",
            user_agent: request.user_agent
        }, :status => 200
    end
end
