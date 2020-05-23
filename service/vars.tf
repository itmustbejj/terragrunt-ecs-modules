variable "module_version" {
  description = "Version of the terraform module"
  type        = string
  default     = "1.0.9"
}

variable "container_name" {
  description = "Name of the container that will be attached to the ALB"
}

variable "container_port" {
  description = "port the container is listening on"
  default     = 80
}

variable "continue_image" {
  description = "Docker image for container"
}

variable "container_memory" {
  description = "The amount (in MiB) of memory to present to the container"
  default     = 128
}

variable "container_cpu" {
  description = "The number of cpu units the ECS container agent will reserve for the container."
  default     = 100
}

variable "essential" {
  description = "If container fails or stops, all other task containers are stopped."
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "AWS region for container's node."
  default     = "us-east-1"
}

variable "environment" {
  description = "Logical environment of container deployment."
  default     = "stage"
}

variable "log_group" {
  description = "Log groups that will be created in CloudWatch Logs"
  default     = ""
}
