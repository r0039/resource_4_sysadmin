#!/bin/bash
# Author:   Tien
# Date:     27/08/2020
# Purpose:  The member page of this repository shows 500 error. So I could not grant the permission on this page. Then I use the Gitlab API to do it. 

curl --request POST --header "PRIVATE-TOKEN: gsu7_Td4ewXTmMyVVnfh" --data "user_id=35&access_level=20" "https://gitlab.skylabteam.com/api/v4/projects/:id/members"
