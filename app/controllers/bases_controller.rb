class BasesController < ApplicationController
  def index
    number = params[:number]
    from = params[:from_base]
    to = params[:to_base]

    if params[:type] == "decimal"
      conversion = NumberHelper.float_to_decimal(number, from)
      render partial: 'pages/answer_dec', locals: {number: conversion}
    else
      conversion = NumberHelper.convert(number, from, to)
      render partial: 'pages/answer', locals: {number: conversion}
    end
  end
end
