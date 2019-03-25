provider "opc" {
  user                = "${var.username}"
  password            = "${var.password}"
  identity_domain     = "${var.domain}"
  endpoint            = "${var.endpoint}"
}

resource "opc_compute_ssh_key" "oct-public-key1" {
  name                = "oct-public-key1"
  key                 = "${file(var.ssh_public_key)}"
  enabled             = true
}

resource "opc_compute_ip_address_prefix_set" "oct_ip_prefix_set" {
  name     = "oct_ip_prefix_set"
  prefixes = ["192.168.0.0/16"]
  tags     = ["oct_ip_prefix_set"]
}

  module "oct_security_defs" {
    source = "../oct-security-lists-rules-applications"
  }

  module "oct_object_storage_openldap" {
    source = "../oct-object-storage-template"
    container_name = "oct_object_storage_openldap"
  }

  module "oct_object_storage_docker" {
    source = "../oct-object-storage-template"
    container_name = "oct_object_storage_docker"
  }

  module "oct_object_storage_git" {
    source = "../oct-object-storage-template"
    container_name = "oct_object_storage_git"
  }

  module "oct_object_storage_gerrit" {
    source = "../oct-object-storage-template"
    container_name = "oct_object_storage_gerrit"
  }

  module "oct_object_storage_jenkins_slave_1" {
    source = "../oct-object-storage-template"
    container_name = "oct_object_storage_jenkins_slave_1"
  }

  module "oct_object_storage_jenkins_slave_2" {
    source = "../oct-object-storage-template"
    container_name = "oct_object_storage_jenkins_slave_1"
  }

  module "oct_object_storage_nexusoss" {
    source = "../oct-object-storage-template"
    container_name = "oct_object_storage_nexusoss"
  }

  module "oct_compute_postgres_docker" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_postgres_docker"
    volume_size = 500
    instance_name = "oct_compute_instance_postgres_docker"
    label = "oct_compute_volume_postgres_docker"
    vm_shape = oc5
    association = "oct_compute_postgres_docker_assoc"
    sec_list_name = "oct_postgres"
  }

  module "oct_compute_postgres_gerrit" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_postgres_gerrit"
    volume_size = 500
    instance_name = "oct_compute_instance_postgres_gerrit"
    label = "oct_compute_volume_postgres_gerrit"
    vm_shape = oc5
    association = "oct_compute_postgres_gerrit_assoc"
    sec_list_name = "oct_postgres"
  }

  module "oct_compute_postgres_sonarqube" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_postgres_sonarqube"
    volume_size = 500
    instance_name = "oct_compute_instance_postgres_sonarqube"
    label = "oct_compute_volume_postgres_sonarqube"
    vm_shape = oc5
    association = "oct_compute_postgres_sonarqube_assoc"
    sec_list_name = "oct_postgres"
  }

  module "oct_compute_postgres_nexussoss" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_postgres_nexusoss"
    volume_size = 500
    instance_name = "oct_compute_instance_postgres_nexusoss"
    label = "oct_compute_volume_postgres_nexusoss"
    vm_shape = oc5
    association = "oct_compute_postgres_nexusoss_assoc"
    sec_list_name = "oct_postgres"
  }

  module "oct_compute_postgres_nexuslifecycle" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_postgres_nexuslifecycle"
    volume_size = 500
    instance_name = "oct_compute_instance_postgres_nexuslifecycle"
    label = "oct_compute_volume_postgres_nexuslifecycle"
    vm_shape = oc5
    association = "oct_compute_postgres_nexuslifecycle_assoc"
    sec_list_name = "oct_postgres"
  }

  module "oct_compute_postgres_jira" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_postgres_jira"
    volume_size = 500
    instance_name = "oct_compute_instance_postgres_jira"
    label = "oct_compute_volume_postgres_jira"
    vm_shape = oc5
    association = "oct_compute_postgres_jira_assoc"
    sec_list_name = "oct_postgres"
  }

  module "oct_compute_postgres_confluence" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_postgres_confluence"
    volume_size = 500
    instance_name = "oct_compute_instance_postgres_confluence"
    label = "oct_compute_volume_postgres_confluence"
    vm_shape = oc5
    association = "oct_compute_postgres_confluence_assoc"
    sec_list_name = "oct_postgres"
  }

  module "oct_compute_postgres_sensu" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_postgres_sensu"
    volume_size = 500
    instance_name = "oct_compute_instance_postgres_sensu"
    label = "oct_compute_volume_postgres_sensu"
    vm_shape = oc5
    association = "oct_compute_postgres_sensu_assoc"
    sec_list_name = "oct_postgres"
  }

  module "oct_compute_postgres_openldap" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_postgres_openldap"
    volume_size = 100
    instance_name = "oct_compute_instance_postgres_openldap"
    label = "oct_compute_volume_postgres_openldap"
    vm_shape = oc4
    association = "oct_compute_postgres_openldap_assoc"
    sec_list_name = "oct_postgres"
  }

  module "oct_compute_openldap" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_openldap"
    volume_size = 100
    instance_name = "oct_compute_instance_openldap"
    label = "oct_compute_volume_openldap"
    vm_shape = oc4
    association = "oct_compute_openldap_assoc"
    sec_list_name = "oct_openldap"
  }

  module "oct_compute_nginx_reverse_proxy" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_nginx_reverse_proxy"
    volume_size = 500
    instance_name = "oct_compute_instance_nginx_reverse_proxy"
    label = "oct_compute_volume_nginx_reverse_proxy"
    vm_shape = oc4
    association = "oct_compute_nginx_reverse_proxy_assoc"
    sec_list_name = "oct_nginx_reverse_proxy"
  }

  module "oct_compute_nginx_forward_proxy" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_nginx_forward_proxy"
    volume_size = 100
    instance_name = "oct_compute_instance_nginx_forward_proxy"
    label = "oct_compute_volume_nginx_forward_proxy"
    vm_shape = oc4
    association = "oct_compute_nginx_forward_proxy_assoc"
    sec_list_name = "oct_nginx_forward_proxy"
  }

  module "oct_compute_elk" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_elk"
    volume_size = 500
    instance_name = "oct_compute_instance_elk"
    label = "oct_compute_volume_elk"
    vm_shape = oc5
    association = "oct_compute_elk_assoc"
    sec_list_name = "oct_elasticsearch_logstash_kibana"
  }

  module "oct_compute_sensu" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_sensu"
    volume_size = 100
    instance_name = "oct_compute_instance_sensu"
    label = "oct_compute_volume_sensu"
    vm_shape = oc4
    association = "oct_compute_sensu_assoc"
    sec_list_name = "oct_sensu"
  }

  module "oct_compute_git" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_git"
    volume_size = 100
    instance_name = "oct_compute_instance_git"
    label = "oct_compute_volume_git"
    vm_shape = oc4
    association = "oct_compute_git_assoc"
    sec_list_name = "oct_git"
  }

  module "oct_compute_devopstools" {
    source = "../oct-instance-template"
    volume_name = "oct_compute_volume_devopstools"
    volume_size = 1024
    instance_name = "oct_compute_instance_devopstools"
    label = "oct_compute_volume_devopstools"
    vm_shape = oc4
    association = "oct_compute_devopstools_assoc"
    sec_list_name = "oct_devopstools"
  }
