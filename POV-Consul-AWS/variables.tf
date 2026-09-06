variable "region" {
  description = "The region where the resources are created"
  default     = "ap-southeast-1"
}

variable "prefix" {
  description = "The prefix will be included in the name of most resources"

}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more"
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "target environment"
  default     = "Production"
}

variable "subnet_prefix" {
  description = "The address prefix to use for the subnet"
  default     = "10.0.10.0/24"
}

variable "department" {
  description = "The department name for the instance"
  default     = "CDS"
}

variable "instance_type" {
  description = "The instance type"
  default     = "t3.micro"
}

