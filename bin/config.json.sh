#!/bin/bash

export ART_USER="$(shyaml get-value artifactory.user < ~/pass.yml)"
export ART_PASSWD="$(shyaml get-value artifactory.passwd < ~/pass.yml)"
export ART_URL="$(shyaml get-value artifactory.url < ~/pass.yml)"
export SONAR_USER="$(shyaml get-value sonar.user < ~/pass.yml)"
export SONAR_PASSWD="$(shyaml get-value sonar.passwd < ~/pass.yml)"
export SONAR_URL="$(shyaml get-value sonar.url < ~/pass.yml)"
export SONAR_DBCONNSTR="$(shyaml get-value sonar.dbConnStr < ~/pass.yml)"
export XLDEPLOY_USER="$(shyaml get-value xl_deploy.user < ~/pass.yml)"
export XLDEPLOY_PASSWD="$(shyaml get-value xl_deploy.password < ~/pass.yml)"

cat <<EOF
{
	"sonar" : {
		"user": "$SONAR_USER",
		"password": "$SONAR_PASSWD",
		"url": "$SONAR_URL",
		"dbConnStr": "$SONAR_DBCONNSTR"
	},
	"artifactory" : {
		"user": "$ART_USER",
		"password": "$ART_PASSWD",
		"url": "$ART_URL"
	},
	"xl_deploy" : {
	  "user": "$XLDEPLOY_USER",
	  "password": "$XLDEPLOY_PASSWD"
  }
}
EOF
	
