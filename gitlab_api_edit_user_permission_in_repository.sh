#!/bin/bash

# Refer: https://docs.gitlab.com/ee/api/members.html

curl --request PUT --header "PRIVATE-TOKEN: gsu7_Td4ewXTmMyVVnfh" --data "user_id=35&access_level=30" "https://gitlab.skylabteam.com/api/v4/projects/361/members/35"
