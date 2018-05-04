#!/usr/bin/python

import smtplib
remitente = "Eguajard <gc.eliizabeth@gmail.com>"
destinatario = "Eurystheus <gc.eliizabeth@gmail.com>"
asunto = "E-mail HTML send from Python"
mensaje = """Hello!<br/> <br/>
This is a mail <b>e-mail</b> send from <b>Python</b>
"""
#
email = """From: %s
To: %s
MIME-Version: 1.0
Content-type: text/html
Subject: %s
%s
""" % (remitente, destinatario, asunto, mensaje)
#
smtp = smtplib.SMTP('localhost')
smtp.sendmail("gc.eliizabeth@gmail.com", "gc.eliizabeth@gmail.com", email)
