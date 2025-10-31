# Example usage of paw_ansible_role_jenkins

# Simple include with default parameters
include paw_ansible_role_jenkins

# Or with custom parameters:
# class { 'paw_ansible_role_jenkins':
#   jenkins_admin_username => 'admin',
#   jenkins_admin_password => 'admin',
#   jenkins_package_state => 'present',
#   jenkins_prefer_lts => false,
#   jenkins_connection_delay => 5,
#   jenkins_connection_retries => 60,
#   jenkins_home => '/var/lib/jenkins',
#   jenkins_hostname => 'localhost',
#   jenkins_http_port => 8080,
#   jenkins_jar_location => '/opt/jenkins-cli.jar',
#   jenkins_url_prefix => undef,
#   jenkins_options => undef,
#   jenkins_java_options => '-Djenkins.install.runSetupWizard=false',
#   jenkins_plugins => [],
#   jenkins_plugins_state => 'present',
#   jenkins_plugin_updates_expiration => 86400,
#   jenkins_plugin_timeout => 30,
#   jenkins_plugins_install_dependencies => true,
#   jenkins_updates_url => 'https://updates.jenkins.io',
#   jenkins_admin_password_file => undef,
#   jenkins_process_user => 'jenkins',
#   jenkins_process_group => '{{ jenkins_process_user }}',
#   jenkins_init_changes => [{'option' => 'JENKINS_OPTS', 'value' => '{{ jenkins_options }}'}, {'option' => 'JAVA_OPTS', 'value' => '{{ jenkins_java_options }}'}, {'option' => 'JENKINS_HOME', 'value' => '{{ jenkins_home }}'}, {'option' => 'JENKINS_PREFIX', 'value' => '{{ jenkins_url_prefix }}'}, {'option' => 'JENKINS_PORT', 'value' => '{{ jenkins_http_port }}'}],
#   jenkins_proxy_host => undef,
#   jenkins_proxy_port => undef,
#   jenkins_proxy_noproxy => ['127.0.0.1', 'localhost'],
#   jenkins_init_folder => '/etc/systemd/system/jenkins.service.d',
#   jenkins_init_file => '{{ jenkins_init_folder }}/override.conf',
#   jenkins_restart_behavior => 'service',
# }
