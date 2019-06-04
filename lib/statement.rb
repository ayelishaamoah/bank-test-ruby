# frozen_string_literal: true

# Statement is used by the Bank class to print a statement
class Statement
  def print_statement(transactions)
    @transactions = transactions
    puts format_statement
  end

  private

  def format_statement
    [format_header, format_transactions].join("\n")
  end

  def format_header
    [justfiy('date'), justfiy(' credit'),
     justfiy(' debit'), ' balance'].join('||')
  end

  def justfiy(heading)
    heading.ljust(11)
  end

  def format_transactions
    @transactions.reverse.map do |transaction|
      credit = format_credit(transaction)
      debit = format_debit(transaction)
      [
        transaction.date.strftime('%d/%m/%Y'),
        credit.to_s.ljust(9),
        debit.to_s.ljust(9),
        format('%.2f', transaction.current_balance)
      ].join(' || ')
    end.join("\n")
  end

  def format_credit(transaction)
    transaction.type == 'credit' ? format('%.2f', transaction.amount) :  ' '
  end

  def format_debit(transaction)
    transaction.type == 'debit' ? format('%.2f', transaction.amount)  :  ' '
  end
end
