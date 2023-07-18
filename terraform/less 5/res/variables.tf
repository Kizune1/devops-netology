variable "ip" {
    type = string
    description = "ip addresses"
    default = "192.168.0.15"
    validation {
      condition = can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.ip ))
      error_message = "Must be form cidr IPv4"
    }
}

variable "ip_list" {
    type = list(string)
    description = "ip addresses"
    default = [ "192.168.0.1", "1.1.1.1", "1270.0.0.1" ]
    validation {
          condition = alltrue([
      for a in var.ip_list : can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", a ))
    ])
    error_message = "Must be form cidr IPv4"
    }
  
}