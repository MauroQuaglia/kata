require 'date'
require_relative '../../kata/underground/ticket_shop'

print 'What kind of ticket do you want: ONEWAY, DAILY or WEEKLY? -> '
ticket = TicketShop.buy(gets.chomp.to_sym)

print 'Scan your ticket [dd/mm/yyyy hh:mm:ss] -> '
while (time = gets.chomp) != 'exit'
  print ticket.scan_at(DateTime.parse(time))
  print "\nRescan at -> "
end