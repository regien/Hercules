#!/usr/bin/python
import smtplib
import email.utils
from email.mime.text import MIMEText

# Create the message
msg = MIMEText('Hello SMTPD!')
msg['To'] = email.utils.formataddr(("gerardalejandro",
                                    "gerardomalpartidavela@gmail.com"))
msg['From'] = email.utils.formataddr(('SMTPD',
                                     'noreply@localhost'))
msg['Subject'] = 'SMTPD test message'

server = smtplib.SMTP('localhost', 1025)
server.set_debuglevel(True)  # show communication with the server
try:
    server.sendmail('noreply@localhost',
                    ["gerardomalpartidavela@gmail.com"],
                    msg.as_string())
finally:
    server.quit()
