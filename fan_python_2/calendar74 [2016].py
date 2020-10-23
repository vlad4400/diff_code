from datetime import date, timedelta

def create_calendar_page(month = None, year = None):
    today = date.today()
    month = month or today.month
    year  = year or today.year
    date_to_check = date(year, month, 1)
    calendar = "--------------------\nMO TU WE TH FR SA SU\n--------------------\n"
    one_day = timedelta(1)
    i = 0
    calendar += '   ' * date_to_check.weekday()
    while date_to_check.month == month:
        if date_to_check.weekday() == 0:
            calendar += '\n'
        calendar += "%02d" % (date_to_check.day)
        if date_to_check.weekday() < 6:
            calendar += ' '
        date_to_check = date_to_check + one_day
    if calendar[-1] == ' ':
        calendar = calendar[:-1]
    return calendar
