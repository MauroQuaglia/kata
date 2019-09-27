require_relative 'ticket'

class TicketShop

  def initialize
    @tickets=Hash.new
    @tickets['ONEWAY']=Ticket.new Proc.new {|m| "BEEP #{m}"}, xxx('l.to_time - f.to_time < 72 * 60')
    @tickets['DAILY']=Ticket.new Proc.new {|m| "DISPLAY DAILY\nBEEP DAILY #{m}"}, Proc.new {|l, f| l.day - f.day < 1 }
    @tickets['WEEKLY']=Ticket.new Proc.new {|m| "DISPLAY WEEKLY\nBEEP WEEKLY #{m}"}, Proc.new {|l, f|  l.year == f.year && l.cweek == f.cweek }
  end

  def get(type)
    @tickets[type]
  end

  def xxx(block)
    Proc.new {|l, f| block}
  end
 end