output "access_key_id" {
	value = module.kind.access_key_id
	sensitive = true
}


output "secret_access_key" {
	value = module.kind.secret_access_key
	sensitive = true
}


