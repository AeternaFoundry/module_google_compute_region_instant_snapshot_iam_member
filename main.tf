resource "google_compute_region_instant_snapshot_iam_member" "compute_region_instant_snapshot_iam_members" {
  for_each = var.compute_region_instant_snapshot_iam_members

  member  = each.value.member
  name    = each.value.name
  role    = each.value.role
  project = each.value.project
  region  = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

