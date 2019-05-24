class Asistencia < ApplicationRecord
  belongs_to :user
  validates :entrada, presence: true
  validate :same_time
  validate :same_day, on: :update
  validate :entry_first

  def same_day
    if salida.strftime('%D') != entrada.strftime('%D')
      errors.add(:entrada, "y salida deben ser el mismo dìa")
    end
  end

  def entry_first
    if (!entrada.blank? && !salida.blank?)
      if entrada.strftime('%D') > salida.strftime('%D')
        errors.add(:entrada, "debe ser menor a la salida")
      end
    end
  end

  def same_time
    if entrada == salida
      errors.add(:entrada, "y salida deben ser diferentes")
    end
  end

  def self.get_best_employee
    counters = get_counters
    counters.select {|key,value| value == counters.values.max}
  end

  def self.get_worst_employee
    counters = get_counters
    counters.select {|key,value| value == counters.values.min}
  end

  def self.get_counters
    group(:user_id).sum(:counter)
  end
end
