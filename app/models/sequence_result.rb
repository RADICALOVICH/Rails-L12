# frozen_string_literal: true

class SequenceResult
  include ActiveModel::Model
  include ActiveModel::Validations
  include SequencesHelper

  attr_accessor :number, :string_array

  validates_presence_of :number, :string_array
  validates :number, format: { with: /\d/, message: 'должно быть числом'}
  validates :string_array, format: { without: /[^\d^\s^]/, message: 'ошибка при вводе строки' }
  validate :valid_length?
  def show
    array = string_array.split.map(&:to_i)
    squares(array)
  end

  def valid_length?
    errors.add(:number, 'is not correct') if string_array&.split&.map(&:to_i)&.length != number.to_i
  end
end