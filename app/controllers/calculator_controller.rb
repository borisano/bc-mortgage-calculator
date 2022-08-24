class CalculatorController < ApplicationController
  def new
    @mortgage = Mortgage.new
  end
end