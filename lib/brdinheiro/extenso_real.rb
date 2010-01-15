module ExtensoReal
  include Extenso
 
  # Escreve por extenso em reais.
  # 
  # Exemplo:
  #  1.por_extenso_em_reais ==> 'um real'
  #  (100.58).por_extenso_em_reais ==> 'cem reais e cinquenta e oito centavos'
  def por_extenso_em_reais
    ExtensoReal.por_extenso_em_reais(self)
  end
  
  # Alias para por_extenso_em_reais
  alias_method :to_extenso_real, :por_extenso_em_reais

  # Escreve o numero por extenso em reais.
  # 
  # Exemplo:
  #  Extenso.por_extenso_em_reais(1) ==> "um real"
  #  Extenso.por_extenso_em_reais(100) ==> "cem reais"
  #  Extenso.por_extenso_em_reais(100.58) ==> "cem reais e cinquenta e oito centavos"  
  def ExtensoReal.por_extenso_em_reais(valor)
    negativo=(valor<0)? " negativo" : ""
    negativos=(valor<0)? " negativos" : ""
    valor = valor.abs
    return 'grátis' if valor == 0
    case valor
    when Integer
      extenso = Extenso.por_extenso(valor)
      if extenso =~ /^(.*)(ão$|ões$)/
        complemento = 'de '
      else
        complemento = ''
      end
      %(#{extenso} #{valor <= 1 ? "real#{negativo}": "#{complemento}reais#{negativos}"})
    when Float
      real,cents=("%.2f" % valor).split(/\./).map{ |m| m.to_i}
      valor_cents=Extenso.por_extenso(cents%100)
      valor_cents+= case cents.to_i%100
      when 0 then ""
      when 1 then " centavo"
      when 2..99 then " centavos"
      end

      if real.to_i > 0
        "#{ExtensoReal.por_extenso_em_reais(real.to_i)}#{cents > 0 ? ' e ' + valor_cents + negativos : real.to_i > 1 ? negativos : negativo }"
      else
        if (cents.to_i%100)==1
           "#{valor_cents}#{negativo}"
        else
           "#{valor_cents}#{negativos}"
        end
      end
    else
      ExtensoReal.por_extenso_em_reais(valor.to_s.strip.gsub(/[^\d]/,'.').to_f)
    end
  end
end

Numeric.send(:include, ExtensoReal)