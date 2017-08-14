variable "environment" {
  description = "Environment tag, e.g prod"
}

variable "image" {
  description = "The docker image name, e.g nginx"

}

variable "name" {
  description = "The service name, if empty the service name is defaulted to the image name"
  default     = ""
}

variable "container_port" {
  description = "The container port"
  default     = 5432
}

resource "aws_ecs_service" "main" {

}

module "task" {
  source = "../task"
  name = "${coalesce(var.name, replace(var.image, "/", "-"))}"
}