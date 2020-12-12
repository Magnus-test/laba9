# frozen_string_literal: true

class PalindromeController < ApplicationController
  def input
    render layout: false
  end

  def view
    val = check_input
    if val
      count = 1
      res = [[count, 1, 1]]
      2.upto(val) do |num|
        res.push [count += 1, num, num**2] if palindrome?(num**2)
      end
    else
      res = if numeric? params[:val]
              'Error. Input is negavite number or 0.'
            else
              'Error. Input is not a number.'
            end
    end

    @result = res
    respond_to do |format|
      format.html
      format.json do
        render json:
          { type: @result.class.to_s, value: @result }
      end
    end
  end

  private

  def palindrome?(num)
    num == num.to_s.reverse.to_i
  end

  def numeric?(obj)
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/)
  end

  def check_input
    if numeric?(params[:val]) && params[:val].to_i.positive?
      params[:val].to_i
    else
      false
    end
  end
end
