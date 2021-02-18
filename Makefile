all: date snapshot_settings.xml release_settings.xml settings.xml

date:
		date

~/pass.yml:
	echo "Copy pass.yml.save to ~/pass.yml and edit it with actual values"

sonar.xml: sonar.xml.templ config.json
	~/bin/mustache config.json sonar.xml.templ > ~/bin/sonar.xml

config.json: config.json.sh ~/pass.yml
	bash -c ./config.json.sh > config.json

~/bin:
	mkdir ~/bin

~/bin/build_dockerfile: build_dockerfile ~/bin
	cp build_dockerfile ~/bin

~/bin/pipeline_script.groovy: pipeline_script.groovy ~/bin
	cp pipeline_script.groovy  ~/bin/pipeline_script.groovy

~/bin/git_list_remote_branches: git_list_remote_branches ~/bin
	cp git_list_remote_branches  ~/bin/git_list_remote_branches

~/bin/g_update_jira: g_update_jira ~/bin
	cp g_update_jira  ~/bin/g_update_jira

~/bin/g_run_fortify: g_run_fortify ~/bin
	cp g_run_fortify  ~/bin/g_run_fortify

~/bin/g_call_take_screenshot: g_call_take_screenshot ~/bin
	cp g_call_take_screenshot  ~/bin/g_call_take_screenshot

~/bin/g_call_sendto_artifactory: g_call_sendto_artifactory ~/bin
	cp g_call_sendto_artifactory  ~/bin/g_call_sendto_artifactory

~/bin/g_call_process_config: g_call_process_config ~/bin
	cp g_call_process_config  ~/bin/g_call_process_config

~/bin/g_extract_screenshot: g_extract_screenshot ~/bin
	cp g_extract_screenshot  ~/bin/g_extract_screenshot

~/bin/g_send_email: g_send_email ~/bin
	cp g_send_email  ~/bin/g_send_email

~/bin/g_sendto_artifactory: g_sendto_artifactory ~/bin
	cp g_sendto_artifactory  ~/bin/g_sendto_artifactory

~/bin/g_process_config: g_process_config ~/bin
	cp g_process_config  ~/bin/g_process_config

~/bin/g_run_container: g_run_container ~/bin
	cp g_run_container  ~/bin/g_run_container

~/bin/g_run_build: g_run_build ~/bin
	cp g_run_build  ~/bin/g_run_build

~/bin/g_run_sonar: g_run_sonar ~/bin
	cp g_run_sonar  ~/bin/g_run_sonar

~/bin/g_take_screenshot: g_take_screenshot ~/bin
	cp g_take_screenshot  ~/bin/g_take_screenshot

~/bin/g_create_container: g_create_container ~/bin
	cp g_create_container  ~/bin/g_create_container

~/bin/generate_dockerfile: generate_dockerfile ~/bin
	cp generate_dockerfile  ~/bin/generate_dockerfile

~/bin/build_artifacts: build_artifacts ~/bin
	cp build_artifacts ~/bin

~/bin/get_build_tag: ~/bin get_build_tag
	cp get_build_tag ~/bin

~/bin/load_jenkins: ~/bin load_jenkins
	cp load_jenkins ~/bin

~/bin/build_base_image: ~/bin build_base_image
	cp build_base_image ~/bin

~/bin/gitl: ~/bin gitl
	cp gitl ~/bin

~/bin/find_in_jenkins: ~/bin find_in_jenkins
	cp find_in_jenkins ~/bin

~/bin/dispatch_jenkins_job: dispatch_jenkins_job
	cp dispatch_jenkins_job ~/bin/dispatch_jenkins_job

~/bin/send_postbuild_notification: send_postbuild_notification
	cp send_postbuild_notification ~/bin/send_postbuild_notification

~/bin/build_java_image: build_java_image
	cp build_java_image ~/bin

settings.xml: settings.xml.templ config.json sonar.xml ~/bin/build_artifacts ~/bin/generate_dockerfile ~/bin/build_dockerfile ~/bin/load_jenkins ~/bin/gitl ~/bin/build_base_image ~/bin/find_in_jenkins ~/bin/dispatch_jenkins_job ~/bin/dispatch_jenkins_job ~/bin/send_postbuild_notification  ~/bin/build_java_image ~/bin/get_build_tag  ~/bin/g_create_container ~/bin/g_run_container ~/bin/g_run_build ~/bin/g_run_sonar ~/bin/g_process_config  ~/bin/g_call_process_config ~/bin/pipeline_script.groovy ~/bin/g_run_fortify  ~/bin/g_update_jira ~/bin/g_call_sendto_artifactory ~/bin/g_sendto_artifactory ~/bin/g_take_screenshot ~/bin/g_call_take_screenshot ~/bin/g_send_email ~/bin/g_extract_screenshot ~/bin/git_list_remote_branches
	~/bin/mustache config.json settings.xml.templ > ~/bin/settings.xml

release_settings.xml: release_settings.xml.templ config.json sonar.xml ~/bin/build_artifacts ~/bin/generate_dockerfile ~/bin/build_dockerfile ~/bin/load_jenkins ~/bin/gitl ~/bin/build_base_image ~/bin/find_in_jenkins
	~/bin/mustache config.json release_settings.xml.templ > ~/bin/release_settings.xml

snapshot_settings.xml: snapshot_settings.xml.templ config.json sonar.xml ~/bin/build_artifacts ~/bin/generate_dockerfile ~/bin/build_dockerfile ~/bin/load_jenkins ~/bin/gitl ~/bin/build_base_image ~/bin/find_in_jenkins
	~/bin/mustache config.json snapshot_settings.xml.templ > ~/bin/snapshot_settings.xml

clean:
	rm -f snapshot_settings.xml config.json sonar.xml ~/bin/gitl ~/bin/build_dockerfile
	rm -f ~/bin/generate_dockerfile ~/bin/build_artifacts ~/bin/load_jenkins
