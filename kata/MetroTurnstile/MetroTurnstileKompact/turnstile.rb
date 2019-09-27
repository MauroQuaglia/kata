require 'date'
require_relative 'ticket_shop'

print 'What kind of ticket do you want: ONEWAY, DAILY or WEEKLY? -> '
ticket = TicketShop.new.get(gets.chomp)

print 'Scan your ticket [dd/mm/yyyy hh:mm:ss] -> '
while (time = gets.chomp) != 'exit'
  print ticket.scan_at(DateTime.parse(time))
  print "\nRescan at -> "
end