class Transaction
  attr_reader :amount, :date, :type, :current_balance

  def initialize(amount, type, account_balance, date = Time.now)
    @amount = amount
    @date = date
    @type = type
    @current_balance = account_balance
    update_balance
  end

  private
  
  def update_balance
    if @type == 'debit'
      @current_balance -= @amount
    elsif @type == 'credit'
      @current_balance += @amount
    end
  end
end
