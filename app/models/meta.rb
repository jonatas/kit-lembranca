class Meta
  METAS = {
    :de_hoje => 8,
    :esta_semana => 32,
    :este_mes => 100
  }
  CORES = {
   0.33 => 'red',
   0.75 => 'yellow',
   1 => 'green'
  }

  def self.pontuar oque, com_quantos = Coisa.send(oque).count
    fator = if oque == :de_hoje
              fator_hora = (Time.now.hour - 8 - 1.5) # comeca o dia as 8h e dura 7h
              if fator_hora <= 0
                fator_hora = 0.1
              end
              fator_hora.to_f / 7.0
            elsif oque == :esta_semana
              Time.now.wday.to_f / 5.0
            else
              Time.now.day.to_f / Time.now.at_end_of_month.day.to_f 
            end
    meta = METAS[oque]

    if fator <= 0
      fator = 1.0/30
    end
    x = com_quantos.to_f / meta.to_f / fator
    puts "#{oque} #{com_quantos.to_f} / #{meta.to_f} / #{fator} = #{x}"
    x
  end
  def self.show
    METAS.keys.each do |oque|
      Meta.pontuar oque
    end
  end
  def self.cor_para pontuacao
    CORES.find do |valor, cor|
      if pontuacao <= valor
        return cor
      end
    end
    return 'green'
  end
  def self.cor oque, quantos
    self.cor_para(self.pontuar(oque, quantos))
  end
end
