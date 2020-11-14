class PalindromeController < ApplicationController
  # respond_to :html, :json, :xml

  def input
    render layout: false
  end

  def view
    unless is_numeric? params[:val] and params[:val].to_i.positive?
      @result = []
      return @count = 0
    end
    val = params[:val].to_i
    count = 1
    res = [ [count, 1, 1] ]
    2.upto(val) do |num|
      if palindrome? (num**2)
        res.push [count += 1, num, num**2]
      end
    end

    @result = res
    @count = count
    respond_to do |format|
      format.html 
      format.json do
        render json:
          {type: @result.class.to_s, value: @result}
          {type: @count.class.to_s, value: @count}
      end
    end

  end

  private 
  def palindrome? num
    num == num.to_s.reverse.to_i
  end

  def is_numeric? obj 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
 end
end
