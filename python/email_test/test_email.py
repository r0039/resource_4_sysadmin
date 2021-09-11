#!/usr/bin/env python3
import smtplib, ssl

port = 587
smtp_server = "smtp.office365.com"
sender_email = "symphony@guru.com"
receiver_email = "admin@guru.com"
password = "Welcometomyhome"
message = """\
Subject: Hi there

This message is sent from Python."""

context = ssl.create_default_context()
with smtplib.SMTP(smtp_server, port) as server:
    server.ehlo()  # Can be omitted
    server.starttls(context=context)
    server.ehlo()  # Can be omitted
    server.login(sender_email, password)
    server.sendmail(sender_email, receiver_email, message)
