# frozen_string_literal: true

pathglob = File.dirname(__FILE__) + '/../lib/**/*.rb'
Dir[pathglob].sort.each { |file| require file }
