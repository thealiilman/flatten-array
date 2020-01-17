require 'spec_helper'
require './flatten_array_service.rb'

describe FlattenArrayService do
  describe '.run' do
    subject { described_class.run(array) }

    context 'unsuccessful' do
      context 'when the argument given is not an array' do
        let(:array) { {} }

        it do
          expect { subject }.to raise_error(
            ArgumentError,
            'The argument given is not an array!'
          )
        end
      end

      context 'when the argument given is an empty array' do
        let(:array) { [] }

        it do
          expect { subject }.to raise_error(
            ArgumentError,
            'The argument given is an empty array!'
          )
        end
      end

      context 'flat array as an argument' do
        let(:array) { [1, 2, 3] }
  
        it do
          expect { subject }.to raise_error(
            ArgumentError,
            "Thy array is flat!\n#{array}"
          )
        end
      end
    end

    context 'successful' do
      let(:flattened_array) { [1, 2, 3] }

      context 'when the array consist of 1 array element' do
        let(:array) { [1, 2, [3]] }

        it { is_expected.to eq(flattened_array) }
      end

      context 'when the array consist of 2 array elements' do
        let(:array) { [[1], 2, [3]] }

        it { is_expected.to eq(flattened_array) }
      end

      context 'when the array consist of an array inside of an array' do
        let(:array) { [[1, [2]], 3] }

        it { is_expected.to eq(flattened_array) }
      end
    end
  end
end
