defmodule Cards do
  @moduledoc """
    provides methods for createing and handleing deck of cards
  """
  @doc """
    returns a list of string representing a dec of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", ];
    suits = ["Spades", "Clubs", "Hearts", "Dimonds"]
    # list comprehension is technically a JS .map
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
 
  end

  def shuffle(deck) do
    Enum.shuffle deck
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in a hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.create.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end
  
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "that file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)

  end
end