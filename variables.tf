variable "event_orchestration_service_cache_variables" {
  description = <<EOT
Map of event_orchestration_service_cache_variables, attributes below
Required:
    - name
    - service
    - configuration (block):
        - data_type (optional)
        - regex (optional)
        - source (optional)
        - ttl_seconds (optional)
        - type (required)
Optional:
    - disabled
    - condition (block):
        - expression (required)
EOT

  type = map(object({
    name     = string
    service  = string
    disabled = optional(bool)
    configuration = object({
      data_type   = optional(string)
      regex       = optional(string)
      source      = optional(string)
      ttl_seconds = optional(number)
      type        = string
    })
    condition = optional(list(object({
      expression = string
    })))
  }))
}

