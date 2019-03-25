resource "opc_compute_security_list" "oct_sec_list_nginx_reverse_proxy" {
  name                 = "oct_nginx_reverse_proxy"
}

resource "opc_compute_security_list" "oct_sec_list_nginx_forward_proxy" {
  name                 = "oct_nginx_forward_proxy"
}

resource "opc_compute_security_list" "oct_sec_list_postgres" {
  name                 = "oct_postgres"
}

resource "opc_compute_security_list" "oct_sec_list_openldap" {
  name                 = "oct_openldap"
}

resource "opc_compute_security_list" "oct_sec_list_elk" {
  name                 = "oct_elasticsearch_logstash_kibana"
}

resource "opc_compute_security_list" "oct_sec_list_elk" {
  name                 = "oct_elasticsearch_logstash_kibana"
}

resource "opc_compute_security_list" "oct_sec_list_sensu" {
  name                 = "oct_sensu"
}

resource "opc_compute_security_list" "oct_sec_list_git" {
  name                 = "oct_git"
}

resource "opc_compute_security_list" "oct_sec_list_docker" {
  name                 = "oct_docker"
}

resource "opc_compute_security_list" "oct_sec_list_devopstools" {
  name                 = "oct_devopstools"
}

resource "opc_compute_security_application" "oct_sec_application_alt_http" {
  name     = "alt_http"
  protocol = "tcp"
  dport    = "8080"
}

resource "opc_compute_security_application" "oct_sec_application_openldap" {
  name     = "openldap"
  protocol = "tcp"
  dport    = "389"
}

resource "opc_compute_security_application" "oct_sec_application_sensu" {
  name     = "openldap"
  protocol = "tcp"
  dport    = "4567"
}

resource "opc_compute_security_application" "oct_sec_application_gerrit_ui" {
  name     = "gerrit_ui"
  protocol = "tcp"
  dport    = "8080"
}

resource "opc_compute_security_application" "oct_sec_application_gerrit_admin" {
  name     = "gerrit_admin"
  protocol = "tcp"
  dport    = "29418"
}

resource "opc_compute_security_application" "oct_sec_application_jenkins_http" {
  name     = "jenkins_http"
  protocol = "tcp"
  dport    = "8082"
}

resource "opc_compute_security_application" "oct_sec_application_jenkins_jnlp" {
  name     = "jenkins_jnlp"
  protocol = "tcp"
  dport    = "50000"
}

resource "opc_compute_security_application" "oct_sec_application_sonarqube" {
  name     = "sonarqube"
  protocol = "tcp"
  dport    = "9000"
}

resource "opc_compute_security_application" "oct_sec_application_nexusoss" {
  name     = "nexusoss"
  protocol = "tcp"
  dport    = "8081"
}

resource "opc_compute_security_application" "oct_sec_application_nexuslifecycle_1" {
  name     = "nexuslifecycle_1"
  protocol = "tcp"
  dport    = "8070"
}

resource "opc_compute_security_application" "oct_sec_application_nexuslifecycle_2" {
  name     = "nexuslifecycle_2"
  protocol = "tcp"
  dport    = "8071"
}

resource "opc_compute_security_application" "oct_sec_application_vault" {
  name     = "vault"
  protocol = "tcp"
  dport    = "8200"
}

resource "opc_compute_security_application" "oct_sec_application_jira" {
  name     = "jira"
  protocol = "tcp"
  dport    = "8083"
}

resource "opc_compute_security_application" "oct_sec_application_confluence_1" {
  name     = "confluence_1"
  protocol = "tcp"
  dport    = "8090"
}

resource "opc_compute_security_application" "oct_sec_application_confluence_2" {
  name     = "confluence_2"
  protocol = "tcp"
  dport    = "8091"
}

resource "opc_compute_security_application" "oct_sec_application_postgres" {
  name     = "postgres"
  protocol = "tcp"
  dport    = "5432"
}

resource "opc_compute_security_application" "oct_sec_application_elasticsearch_1" {
  name     = "elasticsearch_1"
  protocol = "tcp"
  dport    = "9200"
}

resource "opc_compute_security_application" "oct_sec_application_elasticsearch_2" {
  name     = "elasticsearch_2"
  protocol = "tcp"
  dport    = "9300"
}

resource "opc_compute_security_application" "oct_sec_application_kibana" {
  name     = "kibana"
  protocol = "tcp"
  dport    = "5601"
}

resource "opc_compute_security_application" "oct_sec_application_docker" {
  name     = "docker"
  protocol = "tcp"
  dport    = "5000"
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_postgres_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_postgres.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/postgres"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_openldap_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_openldap.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/openldap"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_elasticsearch_1_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_elk.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/elasticsearch_1"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_elasticsearch_2_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_elk.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/elasticsearch_2"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_kibana_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_elk.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/kibana"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_sensu_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_sensu.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/sensu"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_gerrit_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/gerrit"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_jenkins_http_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/jenkins_http"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_jenkins_jnlp_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/jenkins_jnlp"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_sonarqube_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/sonarqube"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_nexusoss_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/nexusoss"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_nexuslifecycle_1_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/nexuslifecycle_1"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_nexuslifecycle_2_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/nexuslifecycle_2"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_vault_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/vault"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_jira_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/jira"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_confluence_1_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/confluence_1"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_confluence_2_ingress" {
  name             = "allow_postgres_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_reverse_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_devopstools.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/confluence_2"
  disabled         = false
}

resource "opc_compute_sec_rule" "oct_sec_rule_allow_allow_docker_ingress" {
  name             = "allow_docker_access"
  source_list      = "seclist:${opc_compute_security_list.oct_sec_list_nginx_forward_proxy.name}"
  destination_list = "seclist:${opc_compute_security_list.oct_sec_list_docker.name}"
  action           = "permit"
  application      = "/Compute-${var.domain}/${var.username}/docker"
  disabled         = false
}
