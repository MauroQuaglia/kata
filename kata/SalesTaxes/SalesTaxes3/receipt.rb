class Receipt

  def initialize
    @receipt=''
  end

  def add(description, price)
    write "#{description}: #{value_for(price)}"
  end

  def add_taxes(taxes)
    write "Sales Taxes: #{value_for(taxes)}"
  end

  def add_total(total)
    write "Total: #{value_for(total)}"
  end

  def print
    @receipt
  end

  private

  def write(line)
    @receipt += line + "\n"
  end

  def value_for(number)
    '%.2f' % number
  end

end