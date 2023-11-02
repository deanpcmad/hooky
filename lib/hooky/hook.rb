require "httparty"

module Hooky
  class Hook

    attr_accessor :directory

    def initialize(directory)
      @directory = directory
    end

    def self.all
      Dir.glob(".hooky/*").map{|d| d.gsub(".hooky/", "")}
    end

    def config_file
      File.read(".hooky/#{directory}/config.json")
    end

    def data_file
      File.read(".hooky/#{directory}/data.json")
    end

    def config
      JSON.parse(config_file)
    end

    def data
      JSON.parse(data_file)
    end

    def url
      config["url"]
    end

    def headers
      config["headers"]
    end

    def httparty
      if config["method"] =~ /GET/
        HTTParty.get(url, body: data, headers: headers)
      elsif config["method"] =~ /POST/
        HTTParty.post(url, body: data, headers: headers)
      end
    end

    def send_request
      resp = httparty

      resp.response
    end

  end
end
