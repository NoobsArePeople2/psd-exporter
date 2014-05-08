#!/usr/bin/env ruby

require 'chunky_png'
require 'fileutils'
require 'psd'

file = ARGV[0] || nil
if file == nil
    puts "You must specify a PSD as the first argument."
    exit
end



output = ARGV[1] || "output"
trim = (ARGV[2] && ARGV[2] == "trim") || false

psd = PSD.new(file, parse_layer_images: true)
psd.parse!

hash = psd.tree.to_hash
w = hash[:document][:width]
h = hash[:document][:height]

psd.tree.descendant_layers.each do |layer|
    path = layer.path.split('/')[0...-1].join('/')
    FileUtils.mkdir_p("#{output}/#{path}")
    pixels = layer.image.to_png

    if trim

        pixels.save("#{output}/#{layer.path}.png", :fast_rgba)

    else

        png = ChunkyPNG::Image.new(w, h, ChunkyPNG::Color::TRANSPARENT)
        png.compose!(pixels, layer.left, layer.top)

        png.save("#{output}/#{layer.path}.png", :fast_rgba)

    end

end