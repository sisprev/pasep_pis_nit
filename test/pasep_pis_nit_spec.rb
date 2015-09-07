require_relative 'minitest_helper'

module Sisprev
  describe PasepPisNit do

    describe 'dado um valor pasep_pis_nit válido e formatado' do

      valor_em_string = %w(
          120.0201.848-2
          120.9650.175-1
          120.0746.783-8
          120.6565.756-3
          120.4422.761-6
          120.4717.693-1
          120.1342.273-5
          120.6325.444-5
          120.9111.644-2
          120.7254.384-5
          120.7925.778-3
          120.5934.453-2
          120.8367.463-6
          120.5516.871-3
          120.5073.243-2
          120.0901.430-0
          120.6857.481-2
          120.2270.587-6
          120.3143.226-7
          120.5116.729-1
          120.7030.758-3
          120.1648.341-7
          120.8239.388-9
          120.9348.631-0
          120.5377.614-7
          120.6777.785-0
          120.4194.842-8
      )

      it 'deve ser válido' do
        valor_em_string.each do |valor|
          validacao = Sisprev::PasepPisNit.new(valor).valido?
          expect(validacao).must_equal true
        end
      end
    end

    describe 'dado um valor pasep_pis_nit válido e não formatado' do
      it 'deve ser válido' do
        validacao = Sisprev::PasepPisNit.new(12041948428).valido?
        expect(validacao).must_equal true
      end
    end

    describe 'dado um valor pasep_pis_nit inválido e não formatado' do
      it 'deve ser inválido' do
        validacao = Sisprev::PasepPisNit.new(12041928428).valido?
        expect(validacao).must_equal false
      end
    end

    describe 'dado um valor pasep_pis_nit inválido e formatado' do
      valor_em_string = %w(
          120.0201.848-1
          120.9650.175-2
          120.0746.783-3
          120.6565.756-4
          120.4422.761-5
          120.4717.693-6
          120.1342.273-7
          120.6325.444-4
          120.9111.644-3
          120.7254.384-4
          120.7925.778-2
          120.5934.453-4
          120.8367.463-8
          120.5516.871-4
          120.5073.243-1
          120.0901.430-1
          120.6857.481-3
          120.2270.587-4
          120.3143.226-5
          120.5116.729-6
          120.7030.758-7
          120.1648.341-6
          120.8239.388-3
          120.9348.631-1
          120.5377.614-3
          120.6777.785-4
          120.4194.842-9
      )
      it 'deve ser inválido' do
        valor_em_string.each do |valor|
          validacao = Sisprev::PasepPisNit.new(valor).valido?
          expect(validacao).must_equal false
        end
      end
    end

    describe 'dado um valor nil' do
      it 'deve ser inválido' do
        validacao = Sisprev::PasepPisNit.new(nil).valido?
        expect(validacao).must_equal false
      end
    end

    describe 'dado uma string vazia' do
      it 'deve ser inválido' do
        validacao = Sisprev::PasepPisNit.new(' ').valido?
        expect(validacao).must_equal false
      end
    end

    describe 'dado um valor com todos dígitos iguais' do
      it 'deve ser inválido' do
        validacao = Sisprev::PasepPisNit.new(22222222222).valido?
        expect(validacao).must_equal false
      end
    end

    describe 'dado um valor com quantidade de dígitos maior que 11' do
      it 'deve ser inválido' do
        validacao = Sisprev::PasepPisNit.new(123456789101).valido?
        expect(validacao).must_equal false
      end
    end
  end
end
