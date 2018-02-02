class BasesController < ApplicationController
  def index
    number = params[:number]
    from = params[:from_base]
    to = params[:to_base]

    conversion = NumberHelper.convert(number, from, to)
    render partial: 'pages/answer', locals: {number: conversion}
  end
end
