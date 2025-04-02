variable "var1" {
    type = string
    default = "My Name is peddireddy"
}
variable "a1" {
    default = 897475
    type = number
}
variable "b" {
    type = map
    default = {name="peddireddy" , age = 25}
}
variable "c" {
    type = list(number)
    default = [ 20,30,40,50,60 ]
}
variable "d" {
  type = bool
  default = false
}