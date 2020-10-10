class PalindromeController < ApplicationController
  def input
  end

  def view
    unless is_numeric? params[:val]
      @count = 0
      @result = []
      return nil
    end
    val = params[:val].to_i
    count = 1
    res = [ [count, 1, 1] ]
    2.upto(val) do |num|
      if palindrome? (num**2)
        res.push [count += 1, num, num**2]
      end
    end
    @count = count
    @result = res
  end

  private 
  def palindrome? num
    num == num.to_s.reverse.to_i
  end

  def is_numeric? obj 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
 end
end
