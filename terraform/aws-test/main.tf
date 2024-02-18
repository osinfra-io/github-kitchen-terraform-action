resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

output "string_out" {
  value = random_string.random.result
}