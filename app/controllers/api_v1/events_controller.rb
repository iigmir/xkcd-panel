require "net/http"

class ApiV1::EventsController < ApplicationController
    def index
        render :json => { message: "Success" }, :status => 200
    end
    def show
        input_param = params[:id].to_i
        status = input_param > 0 && input_param != 404 ? 200 : 404
        res = request_xkcd()
        render :json => { input_param: input_param, res: res }, status: status
    end

    private
    def request_xkcd
        url = URI.parse('http://www.example.com/index.html')
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
            http.request(req)
        }
        return res
    end
end
