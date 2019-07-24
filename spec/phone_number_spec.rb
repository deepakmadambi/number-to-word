require 'rspec'
require_relative '../lib/phone_number.rb'

describe PhoneNumber do
  describe '.get_final_result' do
    it 'returns array all combinations of words' do
      number = PhoneNumber.new('6686787825')
      expect(number.get_final_result).to eql([["mot", "opt", "puck"], ["mot", "opt", "ruck"], ["mot", "opt", "suck"], ["mot", "ort", "puck"], ["mot", "ort", "ruck"], ["mot", "ort", "suck"], ["mot", "opts", "taj"], ["mot", "opus", "taj"], ["mot", "orts", "taj"], ["not", "opt", "puck"], ["not", "opt", "ruck"], ["not", "opt", "suck"], ["not", "ort", "puck"], ["not", "ort", "ruck"], ["not", "ort", "suck"], ["not", "opts", "taj"], ["not", "opus", "taj"], ["not", "orts", "taj"], ["oot", "opt", "puck"], ["oot", "opt", "ruck"], ["oot", "opt", "suck"], ["oot", "ort", "puck"], ["oot", "ort", "ruck"], ["oot", "ort", "suck"], ["oot", "opts", "taj"], ["oot", "opus", "taj"], ["oot", "orts", "taj"], ["noun", "pup", "taj"], ["noun", "pur", "taj"], ["noun", "pus", "taj"], ["noun", "sup", "taj"], ["noun", "suq", "taj"], ["noun", "struck"], ["onto", "pup", "taj"], ["onto", "pur", "taj"], ["onto", "pus", "taj"], ["onto", "sup", "taj"], ["onto", "suq", "taj"], ["onto", "struck"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"])
    end
  end

  shared_examples 'number encoder' do
    it 'checks whether result includes expected examples' do
      result = PhoneNumber.new(number).get_final_result
      expected_op.each do |combination|
        expect(result).to include(combination)
      end
    end
  end

  context 'multiple example' do
    context 'ex1 number: 6686787825' do
      let(:number) { '6686787825' }
      let(:expected_op) do
        [ "motortruck",
          ["motor", "truck"],
          ["motor", "usual"],
          ["noun", "struck"],
          ["not", "opt", "puck"]
        ]
      end

      it_behaves_like 'number encoder'

    end

    context 'ex2 number: 2282668687' do
      let(:number) { '2282668687' }
      let(:expected_op) do
        [ "catamounts",
          ["acta", "mounts"],
          ["act", "amounts"],
          ["act", "contour"],
          ["cat", "boot", "our"]
        ]
      end
      it_behaves_like 'number encoder'
    end
  end

end
