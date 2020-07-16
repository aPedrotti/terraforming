output "ip_address" {
  value = "${aws_instance.web[*].public_ip}"
}

output "priv_key" {
  sensitive = true
  value = "${tls_private_key.pkey.private_key_pem}"
}