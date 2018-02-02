class BasesController < ApplicationController
  def index
    number = params[:number]
    from = params[:from]
    to = params[:to]

    if from == "2"
    elsif from == "8"
    end
    render partial: 'answer', locals: {number: conversion}
  end
end
