## Update security patch 
Confluence sent an email related to https://confluence.atlassian.com/doc/confluence-security-advisory-2021-08-25-1077906215.html 

Atlassian considers it as critical (highest value) and recommends to fix it quickly. It is related to all our Confluence instances as they are running on version 7.4.9 everywhere.

#### How to fix it:
1. Quick work-around - follow recommendation from page above, stop Confluence server and run script from Atlasian to mitigate this vulnerability
2. Upgrade Confluence to 7.4.11 or to latest LTS (7.13.0)

##### Quick work-around
it requires zip and unzip packages 
```
~ > yum install zip unzip -y
```

downdload bash script 
```
~ > wget https://confluence.atlassian.com/doc/files/1077906215/1077916296/2/1629936383093/cve-2021-26084-update.sh
~ > chmod +x cve-2021-26084-update.sh 
```

update the INSTALLATION_DIRECTORY 
```
~ > grep INSTALLATION_DIRECTORY cve-2021-26084-update.sh
# e.g. INSTALLATION_DIRECTORY=/opt/atlassian/confluence
INSTALLATION_DIRECTORY=
if [ -z "$INSTALLATION_DIRECTORY" ]
    echo "Please set INSTALLATION_DIRECTORY within this script and try running this script again.";
if [ ! -w "$INSTALLATION_DIRECTORY/confluence" ]
    echo "ERROR: Please run this script as the Linux user that owns the $INSTALLATION_DIRECTORY/confluence directory"
    echo " (i.e." `ls -ld "$INSTALLATION_DIRECTORY/confluence" | awk '{ print $3 }'`")";
echo "chdir '$INSTALLATION_DIRECTORY'"
cd "$INSTALLATION_DIRECTORY";
    echo "ERROR: Failed to change to the directory $INSTALLATION_DIRECTORY!"
```

then update `INSTALLATION_DIRECTORY` to `/opt/confluence`. Finally, it is 
```
~ > grep INSTALLATION_DIRECTORY cve-2021-26084-update.sh
# e.g. INSTALLATION_DIRECTORY=/opt/atlassian/confluence
INSTALLATION_DIRECTORY=/opt/confluence 
```

stop confluence service 
```
~ > service confluence stop 
```

run bash script
```
./cve-2021-26084-update.sh
chdir '/opt/confluence'

File 1: 'confluence/users/user-dark-features.vm':
   a. backing up file.. done
   b. updating file.. done
   c. showing file changes..
70c70
<             #tag( "Component" "label='Enable dark feature:'" "name='featureKey'" "value='$!action.featureKey'" "theme='aui'" "template='text.vm'")
---
>             #tag( "Component" "label='Enable dark feature:'" "name='featureKey'" "value=featureKey" "theme='aui'" "template='text.vm'")
   d. validating file changes.. ok
   e. file updated successfully!

File 2: 'confluence/login.vm':
   a. backing up file.. done
   b. updating file.. done
   c. showing file changes..
147c147
<                         #tag( "Hidden" "name='token'" "value='$!action.token'" )
---
>                         #tag( "Hidden" "name='token'" "value=token" )
   d. validating file changes.. ok
   e. file updated successfully!

File 3: 'confluence/pages/createpage-entervariables.vm':
   a. backing up file.. done
   b. updating file.. done
   c. showing file changes..
24c24
<                 #tag ("Hidden" "name='queryString'" "value='$!queryString'")
---
>                 #tag ("Hidden" "name='queryString'" "value=queryString")
26c26
<                 #tag ("Hidden" "name='linkCreation'" "value='$linkCreation'")
---
>                 #tag ("Hidden" "name='linkCreation'" "value=linkCreation")
   d. validating file changes..ok
   e. file updated successfully!

File 4: 'confluence/template/custom/content-editor.vm':
   a. backing up file.. done
   b. updating file.. done
   c. showing file changes..
64c64
<         #tag ("Hidden" "name='queryString'" "value='$!queryString'")
---
>         #tag ("Hidden" "name='queryString'" "value=queryString")
85c85
<             #tag ("Hidden" "id=sourceTemplateId" "name='sourceTemplateId'" "value='${templateId}'")
---
>             #tag ("Hidden" "id=sourceTemplateId" "name='sourceTemplateId'" "value=templateId")
   d. file updated successfully!

File 5: 'confluence/WEB-INF/atlassian-bundled-plugins/confluence-editor-loader*.jar':
   a. extracting templates/editor-preload-container.vm from confluence/WEB-INF/atlassian-bundled-plugins/confluence-editor-loader-7.4.9.jar..
Archive:  confluence/WEB-INF/atlassian-bundled-plugins/confluence-editor-loader-7.4.9.jar
  inflating: ./templates/editor-preload-container.vm
   b. updating file.. done
   c. showing file changes..
56c56
< #tag ("Hidden" "id=syncRev" "name='syncRev'" "value='$!{action.syncRev}'")
---
> #tag ("Hidden" "id=syncRev" "name='syncRev'" "value=syncRev")
   d. validating file changes.. ok
   e. updating confluence/WEB-INF/atlassian-bundled-plugins/confluence-editor-loader-7.4.9.jar with ./templates/editor-preload-container.vm..updating: templates/editor-preload-container.vm (deflated 59%)
-rw-r--r--. 1 root root 13394 Sep 16 13:16 confluence/WEB-INF/atlassian-bundled-plugins/confluence-editor-loader-7.4.9.jar
   f. cleaning up temp files..ok
   g. extracting templates/editor-preload-container.vm from confluence/WEB-INF/atlassian-bundled-plugins/confluence-editor-loader-7.4.9.jar again to check changes within JAR..
Archive:  confluence/WEB-INF/atlassian-bundled-plugins/confluence-editor-loader-7.4.9.jar
  inflating: ./templates/editor-preload-container.vm
   h. validating file changes for file within updated JAR.. ok
   i. cleaning up temp files..ok

Update completed!
``` 

start confluence service again 
```
~ > service confluence start
~ > service confluence status 
```
