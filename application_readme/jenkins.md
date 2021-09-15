### Set Build Discarder
Plugin URL: https://plugins.jenkins.io/build-discarder/ 

The Default Build Discarder can be added here: **Manage Jenkins** >> **Configure System** >> **Global Build Discarders** 

Confiruation as Code:
```
unclassified:
  buildDiscarders:
    configuredBuildDiscarders:
    - "jobBuildDiscarder"
    - defaultBuildDiscarder:
        discarder:
          logRotator:
            artifactDaysToKeepStr: "50"
            artifactNumToKeepStr: "5"
            daysToKeepStr: "100"
            numToKeepStr: "10"
```

