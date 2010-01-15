# encoding: UTF-8

class DinheiroInvalidoError < ArgumentError
  def initialize
    super('O valor deve estar preenchido e no formato correto. Ex.: 100.00 .')
  end
end

class DivisaPorNaoEscalarError < ArgumentError
  def initialize
    super('Só é possível dividir dinheiro por numeros.')
  end
end