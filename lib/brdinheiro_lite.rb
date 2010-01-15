$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
  
%w(dinheiro
dinheiro_util
excecoes
nil_class
extenso
extenso_real).each {|req| require File.dirname(__FILE__) + "/brdinheiro/#{req}"}

require 'bigdecimal'

String.send(:include, DinheiroUtil)

class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end
end