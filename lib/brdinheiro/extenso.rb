# encoding: UTF-8
module Extenso 
  @@unidade = {
    0 => "zero",  
    1 => "um",  
    2 => "dois",  
    3 => "três",  
    4 => "quatro",  
    5 => "cinco",  
    6 => "seis",  
    7 => "sete",  
    8 => "oito",  
    9 => "nove" 
  }
  @@dezena = {
    10 => "dez",  
    11 => "onze",  
    12 => "doze",  
    13 => "treze",  
    14 => "quatorze",  
    15 => "quinze",  
    16 => "dezesseis",  
    17 => "dezessete",  
    18 => "dezoito",  
    19 => "dezenove",  
    20 => "vinte",  
    30 => "trinta",  
    40 => "quarenta",  
    50 => "cinquenta",  
    60 => "sessenta",  
    70 => "setenta",  
    80 => "oitenta",  
    90 => "noventa"  }
  @@centena = {100 => "cento",  
    200 => "duzentos",  
    300 => "trezentos",  
    400 => "quatrocentos",  
    500 => "quinhentos",  
    600 => "seiscentos",  
    700 => "setecentos",  
    800 => "oitocentos",  
    900 => "novecentos"  }
  
  # Escreve o numero por extenso.
  # 
  # Exemplo:
  #  1.por_extenso ==> 'um'
  #  100.por_extenso ==> 'cem'
  #  158.por_extenso ==> 'cento e cinquenta e oito'
  def por_extenso
    Extenso.por_extenso(self)
  end
  
  # Alias para o metodo por_extenso
  alias_method :to_extenso, :por_extenso
  
  # Escreve o numero por extenso.
  # 
  # Exemplo:
  #  Extenso.por_extenso(1) ==> "um"
  #  Extenso.por_extenso(100) ==> "cem"
  #  Extenso.por_extenso(158) ==> "cento e cinquenta e oito"  
  def Extenso.por_extenso(numero)
    negativo=(numero<0)? "menos " : ""
    n=numero.to_i.abs
    return case n
    when 0..9 then negativo + @@unidade[n].to_s
    when 10..19 then negativo + @@dezena[n].to_s
    when 20..99
      v=n % 10
      if  v== 0
        negativo + @@dezena[n].to_s
      else
        "#{negativo}#{@@dezena[n-v]} e #{por_extenso(v)}"
      end
    when 100
      negativo+"cem"
    when 101..999
      v=n % 100
      if  v== 0
        negativo + @@centena[n].to_s
      else
        "#{negativo}#{@@centena[n-v]} e #{por_extenso(v)}"
      end
    when 1000..999999
      m,c=n/1000,n%1000
      %(#{negativo}#{por_extenso(m)} mil#{c > 0 ? " e #{por_extenso(c)}":''})
    when 1_000_000..999_999_999
      mi,m=n/1_000_000,n%1_000_000
      %(#{negativo}#{por_extenso(mi)} milh#{mi > 1 ? 'ões':'ão'}#{m > 0 ? " e #{por_extenso(m)}" : ''})
    when 1_000_000_000..999_999_999_999
      bi,mi=n/1_000_000_000,n%1_000_000_000
      %(#{negativo}#{por_extenso(bi)} bilh#{bi > 1 ? 'ões':'ão'}#{mi > 0 ? " e #{por_extenso(mi)}" : ''})
    when 1_000_000_000_000..999_999_999_999_999
      tri,bi=n/1_000_000_000_000,n%1_000_000_000_000
      %(#{negativo}#{por_extenso(tri)} trilh#{tri > 1 ? 'ões':'ão'}#{bi > 0 ? " e #{por_extenso(bi)}" : ''})
    else
      raise "Valor excede o permitido: #{n}"
    end
  end
end