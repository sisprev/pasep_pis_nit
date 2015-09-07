require_relative "pasep_pis_nit/version"

begin
  require "pry"
rescue LoadError
end

module Sisprev
  class PasepPisNit

    # Source:
    # http://www.geradorpis.com
    # http://www.macoratti.net/alg_pis.htm

    attr_reader :numero

    NUMERO_DIGITOS = 11
    MULTIPLICADORES = [3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

    BLACKLIST = %w(
      00000000000
      11111111111
      22222222222
      33333333333
      44444444444
      55555555555
      66666666666
      77777777777
      88888888888
      99999999999
    )

    def initialize(numero)
      @numero_original = numero
      @numero = parser(numero)
    end

    def valido?
      return false if @numero.nil?
      return false if BLACKLIST.include? @numero

      @digito_vericador = @numero[-1].to_i
      digitos_multiplicados = []
      MULTIPLICADORES.each_with_index {|multi, idx| digitos_multiplicados << multi  * @numero[idx].to_i }
      soma = digitos_multiplicados.reduce(:+)
      divisao = soma % 11
      resultado = 11 - divisao
      digito_verificador_calculado = (resultado == 10 || resultado == 11) ? 0 : resultado

      digito_verificador_calculado == @digito_vericador
    end


    private
      def parser(valor)
        return if valor.nil?
        valor = valor.to_s
        numero = somente_digitos_numericos(valor)

        case
          when numero.size > NUMERO_DIGITOS
            return nil
          when numero.size < NUMERO_DIGITOS
            normaliza_quantidade_digitos(numero)
          else
            numero
        end
      end

      def somente_digitos_numericos(valor)
        valor.gsub(/\D/, '')
      end

      def normaliza_quantidade_digitos(valor)
        valor.rjust(NUMERO_DIGITOS, "0")
      end
  end
end
