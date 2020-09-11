#!/usr/bin/env python
import traceback
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


smtp_host = 'email-smtp.us-west-2.amazonaws.com'
smtp_port = 465
email_user = 'AKIAJMYKNUQA4H2CYAIA'
email_password = 'AggE1sjIndnDq9xAmejAw/c2FkVFZDFwvW6tzyCpzkh2'

sent_from = 'x-man@innogram.co'
send_to = ['khanh.ngo@skylabteam.com']
send_cc = []
send_bcc = []
subject = "Test email sending"

# Create message container - the correct MIME type is multipart/alternative.
msg = MIMEMultipart('alternative')
msg['Subject'] =  subject
msg['From'] = sent_from
msg['To'] = ", ".join(send_to)
msg['cc'] = ", ".join(send_cc)

# Plaintext version of the email
text = "This email was sent from AWS SES."

# HTML version of the email
html = """\
&lt;html&gt;
  &lt;head&gt;
  &lt;/head&gt;
  &lt;body&gt;
    This email was sent from AWS SES.
  &lt;/body&gt;
&lt;/html&gt;
"""

part1 = MIMEText(text, 'plain')
part2 = MIMEText(html, 'html')

msg.attach(part1)
msg.attach(part2)

try:
    server = smtplib.SMTP_SSL(smtp_host, smtp_port)  # We are specifying TLS here
    server.ehlo()
    server.login(email_user, email_password)
    server.sendmail(sent_from, send_to + send_cc + send_bcc, msg.as_string())
    server.close()
    print( 'Email(s) Sent')
except:
    print(traceback.format_exc())
    print('Error Sending Email(s)')
