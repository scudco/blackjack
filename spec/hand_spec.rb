# frozen_string_literal: true

require 'spec_helper'

describe Hand do
  subject(:hand) { described_class.new }

  describe '#score' do
    it do
      hand.deal 4, 3
      expect(hand.score).to be(7)
    end

    it do
      hand.deal 8, 5
      expect(hand.score).to be(13)
    end

    it do
      hand.deal 7, 'K'
      expect(hand.score).to be(17)
    end

    it do
      hand.deal 'A', 7
      expect(hand.score).to be(18)
    end

    it do
      hand.deal 'A', 'A'
      expect(hand.score).to be(12)
    end

    it do
      hand.deal 'A', 'A', 'A', 'A'
      expect(hand.score).to be(14)
    end
  end

  describe '#blackjack?' do
    it do
      hand.deal 'A', 'K'
      expect(hand).to be_blackjack
    end

    it do
      hand.deal 'A', 'J'
      expect(hand).to be_blackjack
    end

    it do
      hand.deal 'A', 7, 3
      expect(hand).not_to be_blackjack
    end

    it do
      hand.deal 'J', 'Q'
      expect(hand).not_to be_blackjack
    end
  end

  describe '#bonus?' do
    it do
      hand.deal 7, 7, 7
      expect(hand).to be_bonus
    end

    it do
      hand.deal 6, 7, 8
      expect(hand).to be_bonus
    end

    it do
      hand.deal 7, 6, 8
      expect(hand).to be_bonus
    end

    it do
      hand.deal 5, 7, 9
      expect(hand).not_to be_bonus
    end

    it do
      hand.deal 'A', 7, 7
      expect(hand).not_to be_bonus
    end
  end
end
