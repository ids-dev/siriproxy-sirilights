require 'cora'
require 'siri_objects'
require 'pp'
require 'json' 
require 'open-uri' 
require 'httparty' 

#######
# This is a HomeSeer plugin which with a few things will control your x10 devices via siri
# REQUIRED:-
# X10 Controller
# HomeSeer
# tenHSserver - HomeSeer Plugin -  http://www.tenholder.net/tenWare2/tenHsServer/ 
# Docs - http://www.tenholder.net/tenWare2/tenHsServer/Files/tenHsServer%20Documentation.pdf
# ADD TO start.rb
# require 'plugins/lights/SiriLights'
# AND
# PLUGINS = [SiriLights] 
#
# CREATED BY iDarkside
# E-Mail iphone@idarkside.co.uk
# 
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::SiriLights < SiriProxy::Plugin
  def initialize(config)
	@host = config['homeseer_ip']
    @rooms = config['rooms']
    @room = @rooms.keys[0]
  end

  def execute_x10(command)
    open("http://#{@host}/siri/commands.aspx?t=34&f=ExecX10&d=#{@room}&#{command}").read
  end

  listen_for /lights on/i do
    say "Turning the lights on!"
	execute_x10 'a=on'
    request_completed
  end

  listen_for /lights off/i do
    say "Turning the lights off!"
	execute_x10 'a=off'
    request_completed
  end

  listen_for /dim lights to ([1-9][0-9]?)(?: percent)?/i do |percent|
    say "Dimming the lights to #{percent}%!"
	execute_x10 "a=Dim&s=#{percent}"
    request_completed
  end

  listen_for /dim lights/i do
    say "Dimming the lights!"
	execute_x10 'a=Dim&s=30'
    request_completed
  end

  listen_for /control ?(.*room)/i do |choice|
    choice.downcase!
	key = @rooms.select{|k, v| v.downcase == choice}.keys.first

    if key.nil?
      say "I don't know what the #{choice} is!"
    else
      @room = key
      say "I am now controlling the #{choice}." 
    end
    
    request_completed
  end
end
