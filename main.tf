resource "pagerduty_event_orchestration_service_cache_variable" "event_orchestration_service_cache_variables" {
  for_each = var.event_orchestration_service_cache_variables

  name     = each.value.name
  service  = each.value.service
  disabled = each.value.disabled

  configuration {
    data_type   = each.value.configuration.data_type
    regex       = each.value.configuration.regex
    source      = each.value.configuration.source
    ttl_seconds = each.value.configuration.ttl_seconds
    type        = each.value.configuration.type
  }

  dynamic "condition" {
    for_each = each.value.condition != null ? each.value.condition : []
    content {
      expression = condition.value.expression
    }
  }
}

