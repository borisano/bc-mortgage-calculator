class MortgagesController < ApplicationController
  def new
    @mortgage = Mortgage.new
  end
end