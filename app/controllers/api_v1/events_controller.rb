require "net/http"

class ApiV1::EventsController < ApplicationController
    def index
        render :json => { message: "Success", response: request_xkcd("") }, :status => 200
    end
    def show
        paramenter = params[:id].to_s + "/"
        response = request_xkcd(paramenter)
        status = response[:code]
        render :json => { paramenter: params[:id].to_s, response: response[:body] }, status: status
    end

    private
    def request_xkcd(input_code)
        api = "https://xkcd.com/" + input_code + "info.0.json"
        uri = URI(api)
        res = Net::HTTP.get_response(uri)
        json = {}
        if res.code == "200"
            json = JSON.parse(res.body)
        end
        return { body: json, code: res.code }
    end
end
