# paw_ansible_role_jenkins
# @summary Manage paw_ansible_role_jenkins configuration
#
# @param jenkins_admin_username
# @param jenkins_admin_password
# @param jenkins_package_state Change this to `latest` to update Jenkins if a newer version is available.
# @param jenkins_prefer_lts
# @param jenkins_connection_delay
# @param jenkins_connection_retries
# @param jenkins_home
# @param jenkins_hostname
# @param jenkins_http_port
# @param jenkins_jar_location
# @param jenkins_url_prefix
# @param jenkins_options
# @param jenkins_java_options
# @param jenkins_plugins Plugin list can use the plugin name, or a name/version dict.
# @param jenkins_plugins_state
# @param jenkins_plugin_updates_expiration
# @param jenkins_plugin_timeout
# @param jenkins_plugins_install_dependencies
# @param jenkins_updates_url
# @param jenkins_admin_password_file
# @param jenkins_process_user
# @param jenkins_process_group
# @param jenkins_init_changes
# @param jenkins_proxy_host If Jenkins is behind a proxy, configure this.
# @param jenkins_proxy_port
# @param jenkins_proxy_noproxy
# @param jenkins_init_folder
# @param jenkins_init_file
# @param jenkins_restart_behavior
# @param par_tags An array of Ansible tags to execute (optional)
# @param par_skip_tags An array of Ansible tags to skip (optional)
# @param par_start_at_task The name of the task to start execution at (optional)
# @param par_limit Limit playbook execution to specific hosts (optional)
# @param par_verbose Enable verbose output from Ansible (optional)
# @param par_check_mode Run Ansible in check mode (dry-run) (optional)
# @param par_timeout Timeout in seconds for playbook execution (optional)
# @param par_user Remote user to use for Ansible connections (optional)
# @param par_env_vars Additional environment variables for ansible-playbook execution (optional)
# @param par_logoutput Control whether playbook output is displayed in Puppet logs (optional)
# @param par_exclusive Serialize playbook execution using a lock file (optional)
class paw_ansible_role_jenkins (
  String $jenkins_admin_username = 'admin',
  String $jenkins_admin_password = 'admin',
  String $jenkins_package_state = 'present',
  Boolean $jenkins_prefer_lts = false,
  Integer $jenkins_connection_delay = 5,
  Integer $jenkins_connection_retries = 60,
  String $jenkins_home = '/var/lib/jenkins',
  String $jenkins_hostname = 'localhost',
  Integer $jenkins_http_port = 8080,
  String $jenkins_jar_location = '/opt/jenkins-cli.jar',
  Optional[String] $jenkins_url_prefix = undef,
  Optional[String] $jenkins_options = undef,
  String $jenkins_java_options = '-Djenkins.install.runSetupWizard=false',
  Array $jenkins_plugins = [],
  String $jenkins_plugins_state = 'present',
  Integer $jenkins_plugin_updates_expiration = 86400,
  Integer $jenkins_plugin_timeout = 30,
  Boolean $jenkins_plugins_install_dependencies = true,
  String $jenkins_updates_url = 'https://updates.jenkins.io',
  Optional[String] $jenkins_admin_password_file = undef,
  String $jenkins_process_user = 'jenkins',
  String $jenkins_process_group = '{{ jenkins_process_user }}',
  Array $jenkins_init_changes = [{ 'option' => 'JENKINS_OPTS', 'value' => '{{ jenkins_options }}' }, { 'option' => 'JAVA_OPTS', 'value' => '{{ jenkins_java_options }}' }, { 'option' => 'JENKINS_HOME', 'value' => '{{ jenkins_home }}' }, { 'option' => 'JENKINS_PREFIX', 'value' => '{{ jenkins_url_prefix }}' }, { 'option' => 'JENKINS_PORT', 'value' => '{{ jenkins_http_port }}' }],
  Optional[String] $jenkins_proxy_host = undef,
  Optional[String] $jenkins_proxy_port = undef,
  Array $jenkins_proxy_noproxy = ['127.0.0.1', 'localhost'],
  String $jenkins_init_folder = '/etc/systemd/system/jenkins.service.d',
  String $jenkins_init_file = '{{ jenkins_init_folder }}/override.conf',
  String $jenkins_restart_behavior = 'service',
  Optional[Array[String]] $par_tags = undef,
  Optional[Array[String]] $par_skip_tags = undef,
  Optional[String] $par_start_at_task = undef,
  Optional[String] $par_limit = undef,
  Optional[Boolean] $par_verbose = undef,
  Optional[Boolean] $par_check_mode = undef,
  Optional[Integer] $par_timeout = undef,
  Optional[String] $par_user = undef,
  Optional[Hash] $par_env_vars = undef,
  Optional[Boolean] $par_logoutput = undef,
  Optional[Boolean] $par_exclusive = undef
) {
  # Execute the Ansible role using PAR (Puppet Ansible Runner)
  $vardir = pick($facts['puppet_vardir'], $settings::vardir, '/opt/puppetlabs/puppet/cache')
  $playbook_path = "${vardir}/lib/puppet_x/ansible_modules/ansible_role_jenkins/playbook.yml"

  par { 'paw_ansible_role_jenkins-main':
    ensure        => present,
    playbook      => $playbook_path,
    playbook_vars => {
      'jenkins_admin_username'               => $jenkins_admin_username,
      'jenkins_admin_password'               => $jenkins_admin_password,
      'jenkins_package_state'                => $jenkins_package_state,
      'jenkins_prefer_lts'                   => $jenkins_prefer_lts,
      'jenkins_connection_delay'             => $jenkins_connection_delay,
      'jenkins_connection_retries'           => $jenkins_connection_retries,
      'jenkins_home'                         => $jenkins_home,
      'jenkins_hostname'                     => $jenkins_hostname,
      'jenkins_http_port'                    => $jenkins_http_port,
      'jenkins_jar_location'                 => $jenkins_jar_location,
      'jenkins_url_prefix'                   => $jenkins_url_prefix,
      'jenkins_options'                      => $jenkins_options,
      'jenkins_java_options'                 => $jenkins_java_options,
      'jenkins_plugins'                      => $jenkins_plugins,
      'jenkins_plugins_state'                => $jenkins_plugins_state,
      'jenkins_plugin_updates_expiration'    => $jenkins_plugin_updates_expiration,
      'jenkins_plugin_timeout'               => $jenkins_plugin_timeout,
      'jenkins_plugins_install_dependencies' => $jenkins_plugins_install_dependencies,
      'jenkins_updates_url'                  => $jenkins_updates_url,
      'jenkins_admin_password_file'          => $jenkins_admin_password_file,
      'jenkins_process_user'                 => $jenkins_process_user,
      'jenkins_process_group'                => $jenkins_process_group,
      'jenkins_init_changes'                 => $jenkins_init_changes,
      'jenkins_proxy_host'                   => $jenkins_proxy_host,
      'jenkins_proxy_port'                   => $jenkins_proxy_port,
      'jenkins_proxy_noproxy'                => $jenkins_proxy_noproxy,
      'jenkins_init_folder'                  => $jenkins_init_folder,
      'jenkins_init_file'                    => $jenkins_init_file,
      'jenkins_restart_behavior'             => $jenkins_restart_behavior,
    },
    tags          => $par_tags,
    skip_tags     => $par_skip_tags,
    start_at_task => $par_start_at_task,
    limit         => $par_limit,
    verbose       => $par_verbose,
    check_mode    => $par_check_mode,
    timeout       => $par_timeout,
    user          => $par_user,
    env_vars      => $par_env_vars,
    logoutput     => $par_logoutput,
    exclusive     => $par_exclusive,
  }
}
